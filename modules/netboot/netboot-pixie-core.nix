{ pkgs, netboot }:
# 1. Connect this device directly to the server. On nixos you can use
# github.com/Mic92/dotfiles/nixos/modules/dnsmasq.nix and follow its
# instructions.
# 2. Run the netboot server
# $ nix run '.#netboot-pixie-core'
pkgs.writeShellScriptBin "netboot-pixie-core" ''
  set -euo pipefail -x
  cmdline=$(${pkgs.gnugrep}/bin/grep -ohP 'init=.+' ${netboot}/netboot.ipxe)
  cmdline=$(echo "''${cmdline//initrd=initrd /}" )
  # needs root for RAW_SOCKETS
  sudo ${pkgs.pixiecore}/bin/pixiecore \
    boot ${netboot}/bzImage ${netboot}/initrd \
    --cmdline "$cmdline" \
    --debug --dhcp-no-bind --port 64172 --status-port 64172
''
