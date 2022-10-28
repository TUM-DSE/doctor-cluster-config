#!/usr/bin/env python3

from invoke import task

import subprocess
import sys
import os
import json
import random
import string
import shutil
from pathlib import Path
from typing import List, Any
from deploykit import DeployHost, DeployGroup
from typing import IO, Any, Callable, List, Dict, Optional, Text

ROOT = Path(__file__).parent.resolve()
os.chdir(ROOT)


def get_hosts(hosts: str) -> List[DeployHost]:
    return [DeployHost(h, user="root") for h in hosts.split(",")]


RSYNC_EXCLUDES = ["gdb", "zsh", ".terraform", ".direnv", ".mypy-cache", ".git"]


def deploy_nixos(hosts: List[DeployHost]) -> None:
    """
    Deploy to all hosts in parallel
    """
    g = DeployGroup(hosts)

    def deploy(h: DeployHost) -> None:
        h.run_local(
            f"rsync {' --exclude '.join([''] + RSYNC_EXCLUDES)} -vaF --delete -e ssh . {h.user}@{h.host}:/etc/nixos"
        )

        flake_path = "/etc/nixos"
        flake_attr = h.meta.get("flake_attr")
        if flake_attr:
            flake_path += "#" + flake_attr
        target_host = h.meta.get("target_host", "localhost")
        h.run(
            f"nixos-rebuild switch --option accept-flake-config true --build-host localhost --target-host {target_host} --flake {flake_path}"
        )

    g.run_function(deploy)


def document_cards(hosts: DeployGroup) -> str:
    """
    Documents PCI expansion cards and returns a markdown string.
    """
    cards = """
# Expansion cards and slots

This file is generated through `inv update-docs` by `tasks.py`.

Parameters to consider for matching cards to slots: 

    - long or short: size of slot
    - height: how many pci slots does the card take up? Is it a fat FPGA?
    - internal/external: does the slot need to be accessible from the outside (to plug cables in)

## List of cards

- 1x Nvidia A40 GPU (high profile, dual slot)
- 3x AMD/Xilinx Alveo U50 FPGA (low profile, single slot)
- 4x AMD/Xilinx Alveo U280 FPGA (high profile, dual slot)
    - 1x available
    - 3x bought, on the way
- 3x AMD/Xilinx Alveo SN1022 100GbE SmartNIC (bought, on the way)
- 7x Intel E810-C 100GbE NIC (high and low profile, dual and single port, single slot)
    - jackson: dual port. (Jackson-craig,)
    - christina: dual port. (,)
    - adelaide: single port. (adelaide-craig)
    - wilfred: single port. (wilfred-craig)
    - river: single port. (river-craig)
- 7x Broadcom BCM57416 10G NIC (RJ-45?)
- 5x Intel X520-2 10G NIC (SFI/SFP+)
- 2x Mellanox ConnectX-4 10G NIC (SFI/SFP+?)
- 1x Intel X710 10G NIC (SFI/SFP+?)

Most of the 10G NICs are in use to provider internet.

## List of slots

Note that ubuntu workstations and servers don't appear in this list. 

"""

    def get_slots(h: DeployHost) -> List[str]:
        ret = []
        
        # get pci ids in the same order as inxi
        dmi_slots = h.run("nix-shell -p \'dmidecode\' --run \"sudo dmidecode -t slot\"", stdout=subprocess.PIPE)
        for slot in dmi_slots.stdout.split("System Slot Information")[1:]:
            description = ""
            for line in slot.splitlines():
                if "Bus Address" in line:
                    pciid = line.split(": ")[1].strip()
                    # get slot descriptions
                    description = h.run(f"nix-shell -p \'pciutils\' --run \"lspci -m -s {pciid}\"", stdout=subprocess.PIPE)
                    description = description.stdout.strip()
                    description = description.replace(" \"", ", ")
                    description = description.replace("\"", "")
            if len(description) == 0:
                ret += ["No device/PCI ID."]
            else:
                ret += [description]
        return ret


    def doc_cards(h: DeployHost) -> str:
        result = ""
        descriptions = get_slots(h)
        descriptions.reverse() # reverse so pop gives the first
        inxi_slots = h.run("nix-shell -p \'inxi.override { withRecommends = true; }\' --run \"sudo inxi --slots -xxx -c0 --wrap-max 200\"", stdout=subprocess.PIPE)
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
    results2 = list(map(lambda result: result.result, list(sorted(results, key=lambda i: i.host.host))))
    cards += "".join(results2)
    return cards

def document_nixos(_hosts: List[str]) -> None:
    """
    Generate documentation, expects "hostname.r"
    """
    hosts = DeployGroup([DeployHost(h, user="root") for h in _hosts])

    pwd = os.getcwd()
    os.chdir("docs/hosts")

    # generate per-host docs
    def doc_host(h: DeployHost) -> None:
        h.run_local(f"../generate-host-info.sh {h.host}")
    hosts.run_function(doc_host)

    # generate expansion cards docs
    cards = document_cards(hosts)
    with open("expansion_cards.md", "w") as file:
        file.write(cards)

    os.chdir(pwd)


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
    "astrid.dse.in.tum.de",
    "dan.dse.in.tum.de",
    "mickey.dse.in.tum.de",
    "bill.dse.in.tum.de",
    "nardole.dse.in.tum.de",
    "yasmin.dse.in.tum.de",
    "graham.dse.in.tum.de",
    "ryan.dse.in.tum.de",
    "christina.dse.in.tum.de",
    "jackson.dse.in.tum.de",
    "adelaide.dse.in.tum.de",
    "wilfred.dse.in.tum.de",
    "river.dse.in.tum.de",
    "jack.dse.in.tum.de",
]

# used for different IPMI power readings
MANUFACTURERS = dict({
    "dell": [
        "ryan.dse.in.tum.de",
        "graham.dse.in.tum.de",
        "astrid.dse.in.tum.de",
        "dan.dse.in.tum.de",
        "mickey.dse.in.tum.de",
    ],
    "supermicro": [
        "jackson.dse.in.tum.de",
        "christina.dse.in.tum.de",
        "adelaide.dse.in.tum.de",
        "wilfred.dse.in.tum.de",
        "river.dse.in.tum.de",
        "jack.dse.in.tum.de",
    ],
    "supermicro_broken": [
        "bill.dse.in.tum.de",
        "nardole.dse.in.tum.de",
    ]
})


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
def deploy(c):
    """
    Deploy to servers
    """
    deploy_nixos([DeployHost(h, user="root") for h in HOSTS])


@task
def deploy_host(c, host):
    """
    Deploy to a single host, i.e. inv deploy-host --host 192.168.1.2
    """
    deploy_nixos([DeployHost(host, user="root")])


@task
def deploy_local(c):
    """
    Deploy NixOS configuration on the same machine. The NixOS configuration is
    selected based on the hostname.
    """
    c.run(f"""sudo nixos-rebuild switch --flake .#""")


@task
def update_docs(c, hosts=""):
    """
    Regenerate docs for all servers
    """
    if hosts != "":
        host_list = hosts.split(",")
    else:
        host_list = HOSTS
    document_nixos(host_list)


@task
def update_lldp_info(c, hosts=""):
    """
    Regenerate lldp info for all servers
    """
    if hosts != "":
        host_list = hosts.split(",")
    else:
        host_list = HOSTS
    get_lldp_neighbors(host_list)


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


@task
def install_nixos(c, hosts, flakeattr):
    """
    install nixos, i.e.: inv install-nixos --hosts new-hostname --flakeattr
    """
    for h in get_hosts(hosts):
        h.run("install -m400 --target /mnt/etc/ssh -D /etc/ssh/ssh_host_*")
        h.run("chmod 444 /mnt/etc/ssh/ssh_host_*.pub")
        h.run(
            f"nix --extra-experimental-features 'nix-command flakes' shell nixpkgs#git -c nixos-install --flake github:Mic92/doctor-cluster-config#{flakeattr} && sync"
        )
        info("Device information:")
        info(
            "Remember to note down MAC addresses for IPMI port and network ports connected to foreign routers."
        )
        h.run("nix-shell -p inxi --command 'inxi -F'")
        h.run("nix-shell -p inxi --command 'inxi -FZ'")
        h.run("nix-shell -p ipmitool --command 'ipmitool lan print 1'")
        h.run("nix-shell -p ipmitool --command 'ipmitool lan print 2'")
        h.run("reboot")


@task
def print_tinc_key(c, hosts):
    for h in get_hosts(hosts):
        h.run("tinc.retiolum export")


@task
def print_age_key(c, hosts):
    """
    Print age key for sops, inv print-age-key --hosts "host1,host2"
    """
    for h in get_hosts(hosts):
        h.run(
            "nix-shell -p ssh-to-age --run 'ssh-to-age < /etc/ssh/ssh_host_ed25519_key.pub'"
        )


@task
def generate_ssh_cert(c, host, ip_or_host):
    """
    Generate ssh cert for host, i.e. inv generate-ssh-cert bill 131.159.102.1
    """
    h = host
    c.run(
        f"{ROOT}/modules/sshd/ssh-ca-sign {h} {h}.r,{h}.dse.in.tum.de,{h}.thalheim.io {ip_or_host}"
    )


@task
def update_sops_files(c):
    """
    Update all sops yaml and json files according to .sops.yaml rules
    """

    c.run(
        """
find . \
        -not -path "./.github/*" \
        -not -path "./modules/jumphost/*.yml" \
        -not -path "./modules/monitoring/*.yml" \
        -type f \
        \( -iname '*.enc.json' -o -iname '*.yml' \) \
        -print0 | \
        xargs -0 -n1 sops updatekeys --yes
"""
    )


def wait_for_host(host: str, shutdown: bool = False) -> None:
    import socket, time

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


def ipmi_password(c) -> str:
    return c.run(
        """sops -d --extract '["ipmi-passwords"]' secrets.yml""", hide=True
    ).stdout


@task
def generate_root_password(c):
    """
    Generate password hashes for users i.e. for root in ./hosts/$HOSTNAME.yml
    """
    size = 12
    chars = string.ascii_letters + string.digits
    passw = "".join(random.choice(chars) for x in range(size))
    out = c.run(f"echo '{passw}' | mkpasswd -m sha-512 -s", echo=True)
    print("# Add the following secrets")
    print(f"root-password: {passw}")
    print(f"root-password-hash: {out.stdout}")


@task
def ipmi_serial(c, host=""):
    c.run(
        f"""ipmitool -I lanplus -H {host} -U ADMIN -P '{ipmi_password(c)}' sol info""",
    )
    c.run(
        f"""ipmitool -I lanplus -H {host} -U ADMIN -P '{ipmi_password(c)}' sol activate""",
        pty=True,
    )


@task
def ipmi_powerconsumption(c):
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
    for hostname in MANUFACTURERS['dell']:
        hosts += [hostname.split(".")[0]]
        hostname = mgmt_hostname(hostname)
        print(hostname)
        res = c.run(f"ipmitool -I lanplus -H {hostname} -U ADMIN -P '{ipmi_password(c)}' sensor get Pwr\ Consumption")
        reading = [line for line in res.stdout.splitlines() if "Sensor Reading" in line][0]
        reading = reading.strip().split(":")[1].strip().split(" ")[0]
        total += int(reading)
        print(f"  {reading} Watts")
        print("")

    # supermicro:
    # ipmitool -I lanplus -H 172.24.90.7 -U ADMIN -a dcmi power reading
    for hostname in MANUFACTURERS['supermicro']:
        hosts += [hostname.split(".")[0]]
        hostname = mgmt_hostname(hostname)
        print(hostname)
        res = c.run(f"ipmitool -I lanplus -H {hostname} -U ADMIN -P '{ipmi_password(c)}' dcmi power reading")
        reading = [line for line in res.stdout.splitlines() if "Instantaneous power reading:" in line][0]
        reading = reading.strip().split(":")[1].strip().split(" ")[0]
        total += int(reading)
        print(f"  {reading} Watts")
        print("")

    print("")
    print(f"  Measured hosts: {hosts}")
    print(f"  Total Consumption: {total} Watts")
    print("")


@task
def ipmi_powercycle(c, host=""):
    c.run(
        f"""ipmitool -I lanplus -H {host} -U ADMIN -P '{ipmi_password(c)}' power cycle"""
    )


@task
def run(c, command, hosts=""):
    """
    Run provided command on the given hosts, if no host list is provided, than the command is run on all hosts.
    """
    if hosts == "":
        g = DeployGroup([DeployHost(h, user="root") for h in HOSTS])
    else:
        g = DeployGroup(get_hosts(hosts))
    g.run(command)


@task
def reboot(c, hosts=""):
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
def cleanup_gcroots(c, hosts=""):
    deploy_hosts = [DeployHost(h, user="root") for h in hosts.split(",")]
    for h in deploy_hosts:
        g = DeployGroup([h])
        g.run("find /nix/var/nix/gcroots/auto -type s -delete")
        g.run("systemctl restart nix-gc")
