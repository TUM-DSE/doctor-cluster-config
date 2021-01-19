#!/usr/bin/env nix-shell
#!nix-shell -i bash -p pssh -p bash

# Indented to be executed on rose

set -eu -o pipefail


upgrade_cmd="git -C /etc/nixos pull && git -C /etc/nixos submodule update --init && sudo nixos-rebuild switch"

echo Update $(hostname)
sudo chown -R $USER .
eval $upgrade_cmd
pssh \
  -t 0 \
  -O "ForwardAgent yes" \
  -i -H amy.thalheim.io -H clara.thalheim.io -H donna.thalheim.io -H martha.thalheim.io \
  "$upgrade_cmd"
