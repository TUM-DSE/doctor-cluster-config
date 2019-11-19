#!/usr/bin/env nix-shell
#!nix-shell -i bash -p pssh -p bash

# Indented to be executed on rose

echo Update $(hostname)
(cd /etc/nixos/ && sudo -u joerg git pull && sudo nix-channel --update && sudo nixos-rebuild switch)
pssh \
  -i -H amy.thalheim.io -H clara.thalheim.io -H donna.thalheim.io -H martha.thalheim.io \
  'echo Update $(hostname) && cd /etc/nixos && sudo git pull && sudo nix-channel --update && sudo nixos-rebuild switch'
