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
from deploy_nixos import DeployHost, DeployGroup
from typing import IO, Any, Callable, List, Dict, Optional, Text

ROOT = Path(__file__).parent.resolve()
os.chdir(ROOT)


def get_hosts(hosts: str) -> List[DeployHost]:
    return [DeployHost(h) for h in hosts.split(",")]


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
            f"nixos-rebuild switch --build-host localhost --target-host {target_host} --flake {flake_path}"
        )

    g.run_function(deploy)


def document_nixos(hosts: List[str]) -> None:
    """
    Generate documentation, expects "hostname.r"
    """
    tum = DeployGroup([DeployHost(h) for h in set(hosts).intersection(set(TUM))])
    edi = DeployGroup(
        [
            DeployHost(h)
            for h in set(hosts).intersection(set(EDINBURGH)) - set(["doctor.r"])
        ]
    )

    def doc_tum(h: DeployHost) -> None:
        h.run_local(f"../generate-host-info.sh {h.host}")

    def doc_edi(h: DeployHost) -> None:
        h.run_local(f"../generate-host-info.sh {h.host}")

    pwd = os.getcwd()
    os.chdir("docs/tum")
    tum.run_function(doc_tum)
    os.chdir(pwd)
    os.chdir("docs/edinburgh")
    edi.run_function(doc_edi)
    os.chdir(pwd)


def get_lldp_neighbors(hosts: List[str]) -> None:
    """
    Get LLDP-discovered neighbors, expects "hostname.r"
    """
    tum = DeployGroup([DeployHost(h) for h in set(hosts).intersection(set(TUM))])
    edi = DeployGroup(
        [
            DeployHost(h)
            for h in set(hosts).intersection(set(EDINBURGH)) - set(["doctor.r"])
        ]
    )

    def doc_tum(h: DeployHost) -> None:
        h.run_local(f"../../get-lldp-neighbors.sh {h.host}")

    def doc_edi(h: DeployHost) -> None:
        h.run_local(f"../../get-lldp-neighbors.sh {h.host}")

    pwd = os.getcwd()
    os.chdir("docs/tum")
    if not os.path.exists("lldp"):
        os.mkdir("lldp")
    os.chdir("lldp")
    tum.run_function(doc_tum)
    os.system("../../generate-lldp-graph.sh")
    os.chdir("..")
    shutil.rmtree("lldp", ignore_errors=True)
    os.chdir(pwd)
    os.chdir("docs/edinburgh")
    if not os.path.exists("lldp"):
        os.mkdir("lldp")
    os.chdir("lldp")
    edi.run_function(doc_edi)
    os.system("../../generate-lldp-graph.sh")
    os.chdir("..")
    shutil.rmtree("lldp", ignore_errors=True)
    os.chdir(pwd)


TUM = [
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
EDINBURGH = [
    "rose.r",
    "amy.r",
    "martha.r",
    "clara.r",
    "donna.r",
    "sauron.r",
    "doctor.r",
]

ALL = TUM + EDINBURGH

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
def deploy_tum(c):
    """
    Deploy to TUM servers
    """
    deploy_nixos([DeployHost(h) for h in TUM])


@task
def deploy_host(c, host):
    """
    Deploy to a single host, i.e. inv deploy-host --host 192.168.1.2
    """
    deploy_nixos([DeployHost(host)])


@task
def deploy_local(c, host):
    """
    Deploy NixOS configuration on the same machine. The NixOS configuration is
    selected based on the hostname.
    """
    c.run(
        f"""sudo nixos-rebuild switch --flake .#"""
    )

@task
def deploy_doctor(c):
    """
    Deploy to rpi4, that is used to control power relay
    """
    deploy_nixos([DeployHost("doctor.r")])


@task
def deploy_edinburgh(c):
    """
    Deploy to edinburgh servers starting with rose
    """
    deploy_nixos([DeployHost("rose.r")])
    deploy_nixos([DeployHost(h) for h in set(EDINBURGH) - set(["rose.r", "doctor.r"])])


@task
def update_docs(c, hosts=""):
    """
    Regenerate docs for all servers
    """
    if hosts != "":
        host_list = hosts.split(",")
    else:
        host_list = ALL
    document_nixos(host_list)


@task
def update_lldp_info(c, hosts=""):
    """
    Regenerate lldp info for all servers
    """
    if hosts != "":
        host_list = hosts.split(",")
    else:
        host_list = ALL
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
    c.run(f"{ROOT}/modules/sshd/ssh-ca-sign {h} {h}.r,{h}.dse.in.tum.de,{h}.thalheim.io {ip_or_host}")


@task
def update_sops_files(c):
    """
    Update all sops yaml and json files according to .sops.yaml rules
    """

    c.run(
        """
find . \
        -not -path "./.github/*" \
        -not -path "./.gitlab-ci.yml" \
        -not -path "./.mergify.yml" \
        -type f \
        \( -iname '*.enc.json' -o -iname '*.yml' \) \
        -print0 | \
        xargs -0 -n1 sops updatekeys --yes
"""
    )


def wait_for_host(host: str, shutdown: bool = False) -> None:
    import socket, time

    while True:
            res = subprocess.run(["ping", "-q", "-c", "1", "-w", "2", host], stdout=subprocess.DEVNULL)
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
    passw = ''.join(random.choice(chars) for x in range(size))
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
def ipmi_powercycle(c, host=""):
    c.run(
        f"""ipmitool -I lanplus -H {host} -U ADMIN -P '{ipmi_password(c)}' power cycle"""
    )


@task
def reboot(c, hosts=""):
    """
    Reboot hosts. example usage: fab --hosts clara.r,donna.r reboot
    """
    deploy_hosts = [DeployHost(h) for h in hosts.split(",")]
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
    deploy_hosts = [DeployHost(h) for h in hosts.split(",")]
    for h in deploy_hosts:
        g = DeployGroup([h])
        g.run("find /nix/var/nix/gcroots/auto -type s -delete")
        g.run("systemctl restart nix-gc")
