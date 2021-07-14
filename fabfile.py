#!/usr/bin/env python3

import sys
import os
from typing import List

from fabric import Connection, task
from invoke.context import Context
from fabric.group import ThreadingGroup
from fabric.exceptions import GroupException


def run(group: ThreadingGroup, cmd: str) -> None:
    """
    Runs command and prefix its output with the hostname of the machine its running on.
    """
    group.run(f'set -eu -o pipefail; ({cmd}) 2>&1 | sed -e "s/^/[$HOSTNAME] /;"')


def deploy_nixos(hosts: List[str]) -> None:
    """
    deploy to all hosts in parallel
    """
    try:
        g = ThreadingGroup(*hosts, user="root", forward_agent=True)
        # XXX remove retiolum cleanup at some point
        run(g,
            "git -C /etc/nixos pull https://github.com/Mic92/doctor-cluster-config master && " +
            "git -C /etc/nixos submodule update --init && " +
            "rm -rf /etc/nixos/retiolum")
        run(g, "cd /etc/nixos && nixos-rebuild build")
        run(g, "nixos-rebuild test")

        # reconnect to check if we still access the machines
        g = ThreadingGroup(*hosts, user="root")
        run(g, "nixos-rebuild switch")
    except GroupException as ex:
        for conn, failed in ex.result.failed.items():
            if isinstance(failed.args[0], str):
                msg = failed.args[0]
            else:
                msg = failed.args[0].command
            print(f"=== {conn.user}@{conn.host}: ===")
            print(f"=== {msg} ===")
            if hasattr(failed, "result"):
                print(failed.result)
        sys.exit(1)


@task
def deploy_edinburgh(c):
    """
    Deploy to edinburgh servers starting with rose
    """
    deploy_nixos(["rose.r"])
    deploy_nixos(["amy.r", "martha.r", "clara.r", "donna.r", "sauron.r"])


def wait_for_port(host: str, port: int, shutdown: bool=False) -> None:
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
def reboot(c):
    """
    Reboot hosts. example usage: fab --hosts clara.r,donna.r reboot
    """
    c.user = "root"
    c.run('reboot', asynchronous=True)

    print(f"Wait for {c.host} to shutdown",end="")
    sys.stdout.flush()
    wait_for_port(c.host, c.port, shutdown=True)
    print("")

    print(f"Wait for {c.host} to start", end="")
    sys.stdout.flush()
    wait_for_port(c.host, c.port)
    print("")


@task
def deploy_doctor(c):
    """
    Deploy to rpi4, that is used to control power relay
    """
    deploy_nixos(["doctor.r"])


@task
def deploy_tum(c):
    """
    Deploy to TUM servers
    """
    deploy_nixos(["bill.r", "nardole.r"])

@task
def update_drone(c):
    """
    Build and Sign .drone.yml from .drone.start0
    """
    # TODO: add DRONE_TOKEN to ./secrets
    env = dict(
        PATH=os.environ.get("PATH"),
        DRONE_SERVER="https://drone.thalheim.io/",
        DRONE_TOKEN=os.environ.get("DRONE_TOKEN")
    )
    c.run("drone starlark --stdout .drone.star > .drone.yml", env=env)
    c.run("drone sign --save Mic92/doctor-cluster-config", env=env)
