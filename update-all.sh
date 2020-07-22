#!/usr/bin/env nix-shell
#!nix-shell -i bash -p pssh -p bash

# Indented to be executed on rose

set -eu -o pipefail


if [[ ${1:-} = "--update-channel" ]]; then
    update_channel="sudo nix-channel --update &&"
else
    update_channel=""
fi

echo Update $(hostname)

(cd /etc/nixos/ && sudo -u joerg git pull && $update_channel sudo nixos-rebuild switch)
pssh \
  -t 0 \
  -O "ForwardAgent yes" \
  -i -H amy.thalheim.io -H clara.thalheim.io -H donna.thalheim.io -H martha.thalheim.io \
  "echo Update \$(hostname) && cd /etc/nixos && sudo git pull --recurse-submodules origin master && sudo git submodule update --init && $update_channel sudo nixos-rebuild switch"
