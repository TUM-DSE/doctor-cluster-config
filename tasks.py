#!/usr/bin/env python3

from invoke import task

import subprocess
import sys
import json
from typing import List, Any
from deploy_nixos import DeployHost, DeployGroup


def get_hosts(hosts: str) -> List[DeployHost]:
    return [DeployHost(h) for h in hosts.split(",")]


def deploy_nixos(hosts: List[DeployHost]) -> None:
    """
    Deploy to all hosts in parallel
    """
    g = DeployGroup(hosts)

    def deploy(h: DeployHost) -> None:
        h.run_local(
            f"rsync --exclude='.git/' -vaF --delete -e ssh . {h.user}@{h.host}:/etc/nixos",
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


TUM = ["bill.r", "nardole.r", "yasmin.r", "graham.r", "ryan.r"]
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


@task
def deploy_tum(c):
    """
    Deploy to TUM servers
    """
    deploy_nixos([DeployHost(h) for h in TUM])


@task
def deploy_doctor(c):
    """
    Deploy to rpi4, that is used to control power relay
    """
    deploy_nixos([DeployHost("doctor.r")])


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
            f"nix --extra-experimental-features 'nix-command flakes' shell nixpkgs#git -c nixos-install --flake github:Mic92/doctor-cluster-config#{flakeattr} && sync && reboot"
        )


@task
def print_tinc_key(c, hosts):
    for h in get_hosts(hosts):
        h.run("tinc.retiolum export")


@task
def deploy_edinburgh(c):
    """
    Deploy to edinburgh servers starting with rose
    """
    deploy_nixos([DeployHost("rose.r")])
    deploy_nixos([DeployHost(h) for h in set(EDINBURGH) - set(["rose.r", "doctor.r"])])


def wait_for_port(host: str, port: int, shutdown: bool = False) -> None:
    import socket, time

    while True:
        try:
            with socket.create_connection((host, port), timeout=1):
                if shutdown:
                    time.sleep(1)
                    sys.stdout.write(".")
                    sys.stdout.flush()
                else:
                    break
        except OSError as ex:
            if shutdown:
                break
            else:
                time.sleep(0.01)
                sys.stdout.write(".")
                sys.stdout.flush()


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
        wait_for_port(h.host, h.port, shutdown=True)
        print("")

        print(f"Wait for {h.host} to start", end="")
        sys.stdout.flush()
        wait_for_port(h.host, h.port)
        print("")


@task
def cleanup_gcroots(c, hosts=""):
    deploy_hosts = [DeployHost(h) for h in hosts.split(",")]
    for h in deploy_hosts:
        g = DeployGroup([h])
        g.run("find /nix/var/nix/gcroots/auto -type s -delete")
        g.run("systemctl restart nix-gc")
