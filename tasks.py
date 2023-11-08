#!/usr/bin/env python3

import json
import os
import random
import shutil
import string
import subprocess
import sys
import tempfile
from pathlib import Path
from string import Template
from typing import IO, Any, Callable, List

from deploykit import DeployGroup, DeployHost
from invoke import task

ROOT = Path(__file__).parent.resolve()
os.chdir(ROOT)


def get_hosts(hosts: str) -> List[DeployHost]:
    return [DeployHost(h, user="root") for h in hosts.split(",")]


def deploy_nixos(hosts: List[DeployHost]) -> None:
    """
    Deploy to all hosts in parallel
    """
    g = DeployGroup(hosts)

    res = subprocess.run(
        ["nix", "flake", "metadata", "--json"],
        check=True,
        text=True,
        stdout=subprocess.PIPE,
    )
    data = json.loads(res.stdout)
    path = data["path"]

    def deploy(h: DeployHost) -> None:
        target = f"{h.user or 'root'}@{h.host}"
        flake_path = h.meta.get("flake_path", "/etc/nixos")
        h.run_local(
            f"rsync --checksum -vaF --delete -e ssh {path}/ {target}:{flake_path}"
        )

        flake_attr = h.meta.get("flake_attr")
        if flake_attr:
            flake_path += "#" + flake_attr
        cmd = [
            "nixos-rebuild",
            "switch",
            "--fast",
            "--option",
            "accept-flake-config",
            "true",
            "--flake",
            flake_path,
            "--option",
            "keep-going",
            "true",
        ]
        target_host = h.meta.get("target_host")
        if target_host:
            target_user = h.meta.get("target_user")
            if target_user:
                target_host = f"{target_user}@{target_host}"
            cmd.extend(["--target-host", target_host])
        
        ret = h.run(cmd, check=False)
        # re-retry switch if the first time fails
        if ret.returncode != 0:
            ret = h.run(cmd)

    g.run_function(deploy)


@task
def build_local(c: Any, hosts: str = "") -> None:
    """
    Build nixos configurations locally. Use `inv build-local --hosts ryan` to build a single server
    """
    g = DeployGroup(get_hosts(hosts))

    def build_local(h: DeployHost) -> None:
        h.run_local(
            [
                "nixos-rebuild",
                "build",
                "--option",
                "accept-flake-config",
                "true",
                "--option",
                "keep-going",
                "true",
                "--flake",
                f".#{h.host}",
            ]
        )

    g.run_function(build_local)


@task
def flake_check(c: Any) -> None:
    """
    Run nix checks on this repo (may need a aarch64 remote builder configured)
    """
    cmd = "nix flake check --option allow-import-from-derivation true"
    print(f"$ {cmd}")
    os.system(cmd)


def document_cards(hosts: DeployGroup) -> str:
    """
    Documents PCI expansion cards and returns a markdown string.
    """

    def get_slots(h: DeployHost) -> List[str]:
        ret = []

        # get pci ids in the same order as inxi
        dmi_slots = h.run(
            "nix-shell -p 'dmidecode' --run \"sudo dmidecode -t slot\"",
            stdout=subprocess.PIPE,
            check=False,
        )
        # fails on our m1 aarch64 linux machine
        if dmi_slots.returncode != 0:
            return []
        for slot in dmi_slots.stdout.split("System Slot Information")[1:]:
            description = ""
            for line in slot.splitlines():
                if "Bus Address" in line:
                    pciid = line.split(": ")[1].strip()
                    # get slot descriptions
                    description = h.run(
                        f"nix-shell -p 'pciutils' --run \"lspci -m -s {pciid}\"",
                        stdout=subprocess.PIPE,
                    )
                    description = description.stdout.strip()
                    description = description.replace(' "', ", ")
                    description = description.replace('"', "")
            if len(description) == 0:
                ret += ["No device/PCI ID."]
            else:
                ret += [description]
        return ret

    def doc_cards(h: DeployHost) -> str:
        result = ""
        descriptions = get_slots(h)
        descriptions.reverse()  # reverse so pop gives the first
        inxi_slots = h.run(
            "nix-shell -p 'inxi.override { withRecommends = true; }' --run \"sudo inxi --slots -xxx -c0 --wrap-max 200\"",
            stdout=subprocess.PIPE,
        )
        for line in inxi_slots.stdout.splitlines():
            is_device_line = False
            # print slot description or "PCI Slots:"
            if "status: Available" in line:
                line = f"- ✅{line}"
                is_device_line = True
            if "status: In Use" in line:
                line = f"- ❌{line}"
                is_device_line = True
            result += f"{line}   \n"
            # print expansion card description
            if is_device_line:
                if len(descriptions) == 0:
                    result += "Error\n"
                else:
                    result += f"{descriptions.pop()}  \n"
        return f"### {h.host} \n\n{result} \n\n"

    results = hosts.run_function(doc_cards)
    results2 = list(
        map(
            lambda result: result.result,
            list(sorted(results, key=lambda i: i.host.host)),
        )
    )
    return "".join(results2)


def document_nixos(_hosts: List[str]) -> None:
    """
    Generate documentation, expects "hostname.r"
    """
    hosts = DeployGroup([DeployHost(h, user="root") for h in _hosts])

    # generate per-host docs
    def doc_host(h: DeployHost) -> None:
        h.run_local(f"cd ./docs/hosts && ../generate-host-info.sh {h.host}")

    hosts.run_function(doc_host)
    # generate expansion cards docs
    cards = document_cards(hosts)
    content = f"""# List of slots

Note that ubuntu workstations and servers don't appear in this list.

{cards}
"""
    (ROOT / "docs" / "expansion_cards_autogen.md").write_text(content)


def get_lldp_neighbors(hosts: List[str]) -> None:
    """
    Get LLDP-discovered neighbors, expects "hostname.r"
    """
    tum = DeployGroup([DeployHost(h, user="root") for h in HOSTS])

    def doc_tum(h: DeployHost) -> None:
        h.run_local(f"../../get-lldp-neighbors.sh {h.host}")

    pwd = os.getcwd()
    os.chdir("docs/hosts")
    if not os.path.exists("lldp"):
        os.mkdir("lldp")
    os.chdir("lldp")
    tum.run_function(doc_tum)
    os.system("../../generate-lldp-graph.sh")
    os.chdir("..")
    shutil.rmtree("lldp", ignore_errors=True)
    os.chdir(pwd)


HOSTS = [
    "astrid.dos.cit.tum.de",
    "dan.dos.cit.tum.de",
    "mickey.dos.cit.tum.de",
    "bill.dos.cit.tum.de",
    "nardole.dos.cit.tum.de",
    "yasmin.dos.cit.tum.de",
    "graham.dos.cit.tum.de",
    "ryan.dos.cit.tum.de",
    "christina.dos.cit.tum.de",
    "jackson.dos.cit.tum.de",
    "adelaide.dos.cit.tum.de",
    "wilfred.dos.cit.tum.de",
    "river.dos.cit.tum.de",
    "jack.dos.cit.tum.de",
    "clara.dos.cit.tum.de",
    "amy.dos.cit.tum.de",
    "rose.dos.cit.tum.de",
    "vislor.dos.cit.tum.de",
]

# used for different IPMI power readings
MANUFACTURERS = dict(
    {
        "dell": [
            "ryan.dos.cit.tum.de",
            "graham.dos.cit.tum.de",
            "astrid.dos.cit.tum.de",
            "dan.dos.cit.tum.de",
            "mickey.dos.cit.tum.de",
            "vislor.dos.cit.tum.de",
        ],
        "supermicro": [
            "jackson.dos.cit.tum.de",
            "christina.dos.cit.tum.de",
            "adelaide.dos.cit.tum.de",
            "wilfred.dos.cit.tum.de",
            "river.dos.cit.tum.de",
            "jack.dos.cit.tum.de",
            "clara.dos.cit.tum.de",
            "amy.dos.cit.tum.de",
            "rose.dos.cit.tum.de",
        ],
        "supermicro_broken": [
            "bill.dos.cit.tum.de",
            "nardole.dos.cit.tum.de",
        ],
    }
)


HAS_TTY = sys.stderr.isatty()


def color_text(code: int, file: IO[Any] = sys.stdout) -> Callable[[str], None]:
    def wrapper(text: str) -> None:
        if HAS_TTY:
            print(f"\x1b[{code}m{text}\x1b[0m", file=file)
        else:
            print(text, file=file)

    return wrapper


warn = color_text(31, file=sys.stderr)
info = color_text(32)


@task
def deploy(c: Any) -> None:
    """
    Deploy to servers
    """
    deploy_nixos([DeployHost(h, user="root") for h in HOSTS])


@task
def deploy_ruby(c: Any) -> None:
    """
    Deploy to riscv server
    """
    host = DeployHost(
        "graham.dos.cit.tum.de",
        user="root",
        forward_agent=True,
        command_prefix="ruby",
        meta=dict(
            target_user="root",
            target_host="ruby.r",
            flake_attr="ruby",
            config_dir="/var/lib/nixos-config",
        ),
    )
    deploy_nixos([host])


@task
def deploy_doctor(c: Any) -> None:
    """
    Deploy to doctor
    """
    host = DeployHost(
        "localhost",
        user="root",
        forward_agent=True,
        command_prefix="doctor",
        meta=dict(
            target_user="root",
            target_host="doctor.r",
            flake_attr="doctor",
            config_dir="/var/lib/nixos-config",
        ),
    )
    deploy_nixos([host])


@task
def deploy_host(c: Any, host: str) -> None:
    """
    Deploy to a single host, i.e. inv deploy-host --host 192.168.1.2
    """
    deploy_nixos([DeployHost(host, user="root")])


@task
def deploy_local(c: Any) -> None:
    """
    Deploy NixOS configuration on the same machine. The NixOS configuration is
    selected based on the hostname.
    """
    c.run("""sudo nixos-rebuild switch --flake .#""")


@task
def update_docs(c: Any, hosts: str = "") -> None:
    """
    Regenerate docs for all servers
    """
    if hosts != "":
        host_list = hosts.split(",")
    else:
        host_list = HOSTS
    document_nixos(host_list)


@task
def document_craig(c: Any) -> None:
    """
    Dump craigs (switch) config to encrypted docs/hosts/craig.sops
    """
    # needs encryption because i dont trust the "encryption" used by the admin password found in that file
    craig_sops = f"{ROOT}/docs/hosts/craig.sops"
    with tempfile.TemporaryDirectory() as tmpdir:
        c.run(
            f"ssh ADMIN@craig-mgmt.dos.cit.tum.de 'no cli pagination; show startup-config; exit' > {tmpdir}/craig.txt || true"
        )  # ssh always terminates with 255
        print("Diff old <> new config:")
        c.run(f"diff <(sops -d {craig_sops}) {tmpdir}/craig.txt || true")
        print("Diff end.")
        c.run(f"mv {tmpdir}/craig.txt {craig_sops}")
        c.run(f"sops -e {craig_sops} > {tmpdir}/craig.sops")
        c.run(f"mv {tmpdir}/craig.sops {craig_sops}")
        print(f"Wrote and encrypted {craig_sops}")


@task
def update_lldp_info(c: Any, hosts: str = "") -> None:
    """
    Regenerate lldp info for all servers
    """
    if hosts != "":
        host_list = hosts.split(",")
    else:
        host_list = HOSTS
    get_lldp_neighbors(host_list)


def decrypt_host_keys(c: Any, host: str, tmpdir: str) -> None:
    os.mkdir(f"{tmpdir}/etc")
    os.mkdir(f"{tmpdir}/etc/ssh")
    for keyname in [
        "ssh_host_rsa_key",
        "ssh_host_rsa_key.pub",
        "ssh_host_ed25519_key",
        "ssh_host_ed25519_key.pub",
    ]:
        if keyname.endswith(".pub"):
            os.umask(0o133)
        else:
            os.umask(0o177)
        c.run(
            f"sops --extract '[\"{keyname}\"]' -d {ROOT}/hosts/{host}.yml > {tmpdir}/etc/ssh/{keyname}"
        )


@task
def reformat_install_nixos(c: Any, host: str, dhcp_interface: str) -> None:
    """
    format disks and install nixos, i.e.: inv install-nixos --hostname amy --dhcp-interface eth0
    """
    with tempfile.TemporaryDirectory() as tmpdir:
        decrypt_host_keys(c, host, tmpdir)
        c.run(
            f"sudo nixos-anywhere-pxe --flake .#{host} --netboot-image-flake 'github:nix-community/nixos-images#netboot-installer-nixos-unstable' --dhcp-interface {dhcp_interface} --extra-files {tmpdir} --no-reboot --pause-after-completion"
        )
    info("Device information:")
    info(
        "Remember to note down MAC addresses for IPMI port and network ports connected to foreign routers."
    )
    # TODO after starting nixos-remote-pxe, but before running nixos-remote (or
    # afterwards), we want to check if booted into uefi and:
    # h.run("nix-shell -p inxi --command 'inxi -F'")
    # h.run("nix-shell -p inxi --command 'inxi -FZ'")
    # h.run("nix-shell -p ipmitool --command 'ipmitool lan print 1'")
    # h.run("nix-shell -p ipmitool --command 'ipmitool lan print 2'")
    # h.run("reboot")


@task
def print_tinc_key(c: Any, hosts: str) -> None:
    for h in get_hosts(hosts):
        h.run("tinc.retiolum export")


@task
def print_age_key(c: Any, host: str) -> None:
    """
    Scans for the host key via ssh an converts it to age, i.e. inv scan-age-keys --host <hostname>
    """
    import subprocess

    proc = subprocess.run(
        [
            "sops",
            "--extract",
            '["ssh_host_ed25519_key.pub"]',
            "-d",
            f"{ROOT}/hosts/{host}.yml",
        ],
        text=True,
        stdout=subprocess.PIPE,
        check=True,
    )
    print("###### Age key ######")
    subprocess.run(
        ["nix", "run", "--inputs-from", ".#", "nixpkgs#ssh-to-age"],
        input=proc.stdout,
        check=True,
        text=True,
    )


@task
def generate_ssh_cert(c: Any, host: str) -> None:
    """
    Generate ssh cert for host, i.e. inv generate-ssh-cert bill
    """
    h = host
    sops_file = f"{ROOT}/hosts/{host}.yml"
    with tempfile.TemporaryDirectory() as tmpdir:
        # should we use ssh-keygen -A (Generate host keys of all default key tpyes) here?
        c.run(f"mkdir -p {tmpdir}/etc/ssh")
        for keytype in ["rsa", "ed25519"]:
            res = c.run(
                f"sops --extract '[\"ssh_host_{keytype}_key.pub\"]' -d {sops_file}",
                warn=True,
            )
            privkey = Path(f"{tmpdir}/etc/ssh/ssh_host_{keytype}_key")
            pubkey = Path(f"{tmpdir}/etc/ssh/ssh_host_{keytype}_key.pub")
            if len(res.stdout) == 0:
                # create host key with comment -c and empty passphrase -N ''
                c.run(
                    f"ssh-keygen -f {privkey} -t {keytype} -C 'host key for host {host}' -N ''"
                )
                c.run(
                    f"sops --set '[\"ssh_host_{keytype}_key\"] {json.dumps(privkey.read_text())}' {sops_file}"
                )
                c.run(
                    f"sops --set '[\"ssh_host_{keytype}_key.pub\"] {json.dumps(pubkey.read_text())}' {sops_file}"
                )
            else:
                # save existing cert so we can generate an ssh certificate
                pubkey.write_text(res.stdout)

        os.umask(0o077)
        c.run(
            f"sops --extract '[\"ssh-ca\"]' -d {ROOT}/modules/sshd/ca-keys.yml > {tmpdir}/ssh-ca"
        )
        # .dse.in.tum.de is legacy, remove soon
        valid_hostnames = f"{h}.r,{h}.dse.in.tum.de,{h}.dos.cit.tum.de,{h}.thalheim.io"
        pubkey_path = f"{tmpdir}/etc/ssh/ssh_host_ed25519_key.pub"
        c.run(
            f"ssh-keygen -h -s {tmpdir}/ssh-ca -n {valid_hostnames} -I {h} {pubkey_path}"
        )
        signed_key_src = f"{tmpdir}/etc/ssh/ssh_host_ed25519_key-cert.pub"
        signed_key_dst = f"{ROOT}/modules/sshd/certs/{host}-cert.pub"
        c.run(f"mv {signed_key_src} {signed_key_dst}")


@task
def update_sops_files(c: Any) -> None:
    """
    Update all sops yaml and json files according to .sops.yaml rules
    """
    with open(f"{ROOT}/.sops.yaml", "w") as f:
        print("# AUTOMATICALLY GENERATED WITH:", file=f)
        print("# $ inv update-sops-files", file=f)

    c.run(f"nix eval --json -f {ROOT}/sops.yaml.nix | yq e -P - >> {ROOT}/.sops.yaml")
    c.run(
        f"""
find {ROOT} \
        -not -path "{ROOT}/.github/*" \
        -not -path "{ROOT}/modules/jumphost/*.yml" \
        -not -path "{ROOT}/modules/monitoring/*.yml" \
        -not -path "{ROOT}/.mergify.yml" \
        -type f \
        \( -iname '*.enc.json' -o -iname '*.yml' \) \
        -print0 | \
        xargs -0 -n1 sops updatekeys --yes
"""
    )


def wait_for_host(host: str, shutdown: bool = False) -> None:
    import time

    while True:
        res = subprocess.run(
            ["ping", "-q", "-c", "1", "-w", "2", host], stdout=subprocess.DEVNULL
        )
        if shutdown:
            if res.returncode == 1:
                break
        else:
            if res.returncode == 0:
                break
        time.sleep(1)
        sys.stdout.write(".")
        sys.stdout.flush()


def ipmi_password(c: Any) -> str:
    return c.run(
        """sops -d --extract '["ipmi-passwords"]' secrets.yml""", hide=True
    ).stdout


@task
def generate_password(c: Any, user: str = "root") -> None:
    """
    Generate password hashes for users i.e. for root in ./hosts/$HOSTNAME.yml
    """
    size = 12
    chars = string.ascii_letters + string.digits
    passw = "".join(random.choice(chars) for x in range(size))
    out = c.run(f"echo '{passw}' | mkpasswd -m sha-512 -s", echo=True)
    print("# Add the following secrets")
    print(f"{user}-password: {passw}")
    print(f"{user}-password-hash: {out.stdout}")


@task
def add_server(c: Any, hostname: str) -> None:
    """
    Generate new server keys and configurations for a given hostname and hardware config
    """

    import subprocess

    print(f"Adding {hostname}")

    keys = None
    with open(f"{ROOT}/pubkeys.json", "r") as f:
        keys = f.read()
    keys = json.loads(keys)
    if keys["machines"].get(hostname, None):
        print("Configuration already exists")
        exit(-1)
    keys["machines"][hostname] = ""
    with open(f"{ROOT}/pubkeys.json", "w") as f:
        json.dump(keys, f, indent=2)

    update_sops_files(c)

    sops_file = f"{ROOT}/hosts/{hostname}.yml"

    print("Generating Password")
    size = 12
    chars = string.ascii_letters + string.digits
    passwd = "".join(random.choice(chars) for x in range(size))
    passwd_hash = subprocess.check_output(
        ["mkpasswd", "-m", "sha-512", "-s"], input=passwd, text=True
    )
    with open(sops_file, "w") as hosts:
        hosts.write(f"root-password: {passwd}\n")
        hosts.write(f"root-password-hash: {passwd_hash}")
    enc_out = subprocess.check_output(["sops", "-e", f"{sops_file}"], text=True)
    with open(sops_file, "w") as hosts:
        hosts.write(enc_out)

    print("Generating SSH certificate")
    generate_ssh_cert(c, hostname)

    print("Generating age key")
    key_ed = subprocess.Popen(
        ["sops", "--extract", '["ssh_host_ed25519_key.pub"]', "-d", sops_file],
        stdout=subprocess.PIPE,
    )

    age = subprocess.check_output(
        ["nix", "run", "--inputs-from", ".#", "nixpkgs#ssh-to-age"],
        text=True,
        stdin=key_ed.stdout,
    )
    age = age.rstrip()

    print("Updating pubkeys.json")
    keys = None
    with open(f"{ROOT}/pubkeys.json", "r") as f:
        keys = json.load(f)
    keys["machines"][hostname] = age
    with open(f"{ROOT}/pubkeys.json", "w") as f:
        json.dump(keys, f, indent=2)

    print("Updating sops files")
    update_sops_files(c)

    example_host_config = f"""
{{
  imports = [
    ../modules/hardware/placeholder.nix
  ];

  networking.hostName = "{hostname}";

  system.stateVersion = "22.11";
}}"""
    print(f"Writing example hosts/{hostname}.nix")
    with open(f"{ROOT}/hosts/{hostname}.nix", "w") as f:
        f.write(example_host_config)

    c.run(
        "git add "
        + f"{ROOT}/hosts/{hostname}.nix "
        + f"{ROOT}/hosts/{hostname}.yml "
        + f"{ROOT}/pubkeys.json "
        + f"{ROOT}/.sops.yaml "
        + f"{ROOT}/modules/secrets.yml "
        + f"{ROOT}/modules/sshd/certs/{hostname}-cert.pub"
    )


def ipmitool(c: Any, host: str, cmd: str) -> subprocess.CompletedProcess:
    return c.run(
        f"""ipmitool -I lanplus -H {host} -U ADMIN -P '{ipmi_password(c)}' {cmd}""",
        pty=True,
    )


@task
def ipmi_serial(c: Any, host: str = "") -> None:
    """
    Connect to the serial console of a server via IPMI
    """
    ipmitool(c, host, "sol info")
    ipmitool(c, host, "sol activate")


@task
def ipmi_powerconsumption(c: Any) -> None:
    """
    Measure the power consumption of our servers via IPMI. Note that this does not include all servers.
    """

    def mgmt_hostname(hostname: str) -> str:
        splits = hostname.split(".")
        splits[0] = f"{splits[0]}-mgmt"
        hostname = ".".join(splits)
        return hostname

    total = 0
    hosts = []

    # dell:
    # ipmitool -I lanplus -H 172.24.90.7 -U ADMIN -a sensor get Pwr\ Consumption
    for hostname in MANUFACTURERS["dell"]:
        hosts += [hostname.split(".")[0]]
        hostname = mgmt_hostname(hostname)
        print(hostname)
        res = ipmitool(c, hostname, "sensor get Pwr\\ Consumption")
        reading = [
            line for line in res.stdout.splitlines() if "Sensor Reading" in line
        ][0]
        reading = reading.strip().split(":")[1].strip().split(" ")[0]
        total += int(reading)
        print(f"  {reading} Watts")
        print("")

    # supermicro:
    # ipmitool -I lanplus -H 172.24.90.7 -U ADMIN -a dcmi power reading
    for hostname in MANUFACTURERS["supermicro"]:
        hosts += [hostname.split(".")[0]]
        hostname = mgmt_hostname(hostname)
        print(hostname)
        res = ipmitool(c, hostname, "dcmi power reading")
        reading = [
            line
            for line in res.stdout.splitlines()
            if "Instantaneous power reading:" in line
        ][0]
        reading = reading.strip().split(":")[1].strip().split(" ")[0]
        total += int(reading)
        print(f"  {reading} Watts")
        print("")

    print("")
    print(f"  Measured hosts: {hosts}")
    print(f"  Total Consumption: {total} Watts")
    print("")


@task
def ipmi_powercycle(c: Any, host: str = "") -> None:
    """
    Power cycle a host via IPMI
    """
    ipmitool(c, host, "power cycle")


@task
def ipmi_reboot_bmc(c: Any, host: str = "") -> None:
    """
    Reboot the BMC (IPMI firmware)
    """
    ipmitool(c, host, "bmc reset cold")


def ipmi_boot(c: Any, host: str, bootdev: str) -> None:
    ipmitool(c, host, f"chassis bootdev {bootdev}")
    ipmitool(c, host, "power cycle")


@task
def ipmi_boot_bios(c: Any, host: str = "") -> None:
    """
    Set the next boot to bios and reboot
    """
    ipmi_boot(c, host, "bios")

@task
def ipmi_boot_pxe(c: Any, host: str = "") -> None:
    """
    Set the next boot to bios and reboot
    """
    ipmi_boot(c, host, "pxe")


@task
def run(c: Any, command: str, hosts: str = "") -> None:
    """
    Run provided command on the given hosts, if no host list is provided, than the command is run on all hosts.
    """
    if hosts == "":
        g = DeployGroup([DeployHost(h, user="root") for h in HOSTS])
    else:
        g = DeployGroup(get_hosts(hosts))
    g.run(command)


@task
def reboot(c: Any, hosts: str = "") -> None:
    """
    Reboot hosts. example usage: fab --hosts clara.r,donna.r reboot
    """
    deploy_hosts = [DeployHost(h, user="root") for h in hosts.split(",")]
    for h in deploy_hosts:
        g = DeployGroup([h])
        g.run("reboot &")

        print(f"Wait for {h.host} to shutdown", end="")
        sys.stdout.flush()
        wait_for_host(h.host, shutdown=True)
        print("")

        print(f"Wait for {h.host} to start", end="")
        sys.stdout.flush()
        wait_for_host(h.host)
        print("")


@task
def cleanup_gcroots(c: Any, hosts: str = "") -> None:
    deploy_hosts = [DeployHost(h, user="root") for h in hosts.split(",")]
    for h in deploy_hosts:
        g = DeployGroup([h])
        g.run("find /nix/var/nix/gcroots/auto -type s -delete")
        g.run("systemctl restart nix-gc")


@task 
def update_host_keys(c: Any, hosts: str = "") -> None: 
    """
    Update host ssh keys in corresponding host.yml
    """
    key_files = [
        "ssh_host_ed25519_key",
        "ssh_host_ed25519_key.pub",
        "ssh_host_rsa_key",
        "ssh_host_rsa_key.pub"
    ]
    if hosts == "":
        g = DeployGroup([DeployHost(h, user="root") for h in HOSTS])
    else:
        g = DeployGroup(get_hosts(hosts))
    for key in key_files:
        results = g.run(f"cat /etc/ssh/{key}", stdout=subprocess.PIPE)
        for result in results:
            hostname = result.host.host.split(".")[0]
            sops_file = f"{ROOT}/hosts/{hostname}.yml"
            c.run(f"sops --set '[\"{key}\"] {json.dumps(result.result.stdout)}' {sops_file}")

def sfdisk_json(host: DeployHost, dev: str) -> List[Any]:
    out = host.run(f"sfdisk --json {dev}", stdout=subprocess.PIPE)
    data = json.loads(out.stdout)
    return data["partitiontable"]["partitions"]


def _format_disks(host: DeployHost, device: str) -> None:
    # format disk with as follow:
    # - partition 1 will be the boot partition
    # - partition 2 takes up the rest of the space and is for the system
    host.run(f"blkdiscard -f {device}")
    host.run(f"sgdisk -Z -n 1:2048:+1G -N 2 -t 1:ef00 -t 2:8304 {device}")

    partitions = sfdisk_json(host, device)
    boot = partitions[0]["node"]
    uuid = partitions[1]["uuid"].lower()
    root_part = f"/dev/disk/by-partuuid/{uuid}"
    host.run(
        f"zpool create zroot -O acltype=posixacl -O xattr=sa -O compression=lz4 -O atime=off {root_part}"
    )

    host.run(f"partprobe")
    host.run(f"mkfs.vfat {boot} -n NIXOS_BOOT")

    # setup zfs dataset
    host.run(f"zfs create -o mountpoint=none zroot/root")
    host.run(f"zfs create -o mountpoint=none zroot/docker")
    host.run(f"zfs create -o mountpoint=legacy zroot/root/nixos")
    host.run(f"zfs create -o mountpoint=legacy zroot/root/home")


def _mount_disks(host: DeployHost, device: str) -> None:
    host.run(f"zpool import -af")
    # and finally mount
    host.run(f"mount -t zfs zroot/root/nixos /mnt")
    host.run(f"mkdir -p /mnt/home /mnt/boot")
    host.run(f"mount -t zfs zroot/root/home /mnt/home")
    host.run(f"mount /dev/disk/by-label/NIXOS_BOOT /mnt/boot")


@task
def format_disks(c, hosts, disk=""):
    """
    Format disks with zfs, i.e.: inv format-disks --hosts new-hostname --disk /dev/nvme0n1
    """
    for h in get_hosts(hosts):
        _format_disks(h, disk)
        _mount_disks(h, disk)


@task
def mount_disks(c, hosts, disk=""):
    """
    Mount disks from the installer, i.e.: inv mount-disks --hosts new-hostname --disk /dev/nvme0n1
    """
    for h in get_hosts(hosts):
        _mount_disks(h, disk)
