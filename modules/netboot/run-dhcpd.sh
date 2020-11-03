#!/usr/bin/env bash
set -euo pipefail

# assumes that virbr0 is the VM bridge
dhcpd -d -cf dhcpd.conf virbr0
