#!/usr/bin/env bash
set -euo pipefail

# VM to simulate netboot
qemu-system-x86_64 \
  -enable-kvm \
  -nographic \
  -m 4096 \
  -boot n \
  -bios "${OVMF}/FV/OVMF.fd" \
  -net nic \
  -net tap,ifname=tap0,script=no,downscript=no
