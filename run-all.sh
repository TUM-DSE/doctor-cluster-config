#!/usr/bin/env nix-shell
#!nix-shell -i bash -p pssh -p bash

set -eu -o pipefail

pssh \
  -t 0 \
  -O "ForwardAgent yes" \
  -i -H rose.thalheim.io -H amy.thalheim.io -H clara.thalheim.io -H donna.thalheim.io -H martha.thalheim.io \
  "$@"
