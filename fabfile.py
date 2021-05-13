#!/usr/bin/env python3

from fabric import Connection, task
from invoke.context import Context
from fabric.group import ThreadingGroup
from fabric.exceptions import GroupException

from typing import List


def deploy_nixos(hosts: List[str]) -> None:
    """
    deploy to all hosts in parallel
    """
    try:
        group = ThreadingGroup(*hosts, user="root", forward_agent=True)
        group.run("git -C /etc/nixos pull && git -C /etc/nixos submodule update --init")
        group.run('cd /etc/nixos && nix build .#$(hostname) 2>&1 | sed -e "s/^/[$(hostname)] /;"')

        group.run('cd /etc/nixos && ./result | sed -e "s/^/[$(hostname)] /;"')
    except GroupException as ex:
        for conn, failed in ex.result.failed.items():
            cmd = failed.args[0].command
            print(f"=== {conn.user}@{conn.host}: ===")
            print(f"=== {cmd} ===")
            print(failed.result)
        import sys

        sys.exit(1)


@task
def deploy_edinburgh(c):
    """
    Deploy to edinburgh servers starting with rose
    """
    deploy_nixos(["rose.r"])
    deploy_nixos(["amy.r", "martha.r", "clara.r", "donna.r", "sauron.r"])


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
