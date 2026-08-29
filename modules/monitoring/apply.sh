#!/usr/bin/env bash
# Ubuntu side of the monitoring VMs (the NixOS side is `inv deploy-doctor`).
# First install of a container: build the rootfs and pass it along, e.g.
#   nix build .#nixosConfigurations.doctor.config.system.build.tarball
#   ./apply.sh -l dosvm5.cit.tum.de -e tarball=$(realpath result/tarball/nixos-system-x86_64-linux.tar.xz)
set -euo pipefail
cd "$(dirname "$0")"
ansible-playbook -i inventory network.yml nspawn.yml upgrades.yml "$@"
