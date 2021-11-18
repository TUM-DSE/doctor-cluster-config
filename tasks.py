#!/usr/bin/env python3

from invoke import task

import sys
from typing import List
from deploy_nixos import DeployHost, DeployGroup


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


@task
def deploy_edinburgh(c):
    """
    Deploy to edinburgh servers starting with rose
    """
    deploy_nixos([DeployHost("rose.r")])
    deploy_nixos([DeployHost(h) for h in set(EDINBURGH) - set(["rose.r", "doctor.r"])])


@task
def reload_tinc(c):
    g = DeployGroup(DeployHost(h) for h in ALL)
    g.run("systemctl reload tinc.retiolum")


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
