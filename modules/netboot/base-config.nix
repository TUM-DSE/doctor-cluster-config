{
  lib,
  pkgs,
  ...
}:
{
  networking.firewall.enable = false;

  services.resolved.enable = false;
  networking.nameservers = [
    # hurricane electric
    "74.82.42.42"
    "2001:470:20::2"
  ];

  networking.usePredictableInterfaceNames = false;
  systemd.network.enable = true;
  systemd.network.networks =
    lib.mapAttrs'
      (
        num: _:
        lib.nameValuePair "eth${num}" {
          extraConfig = ''
            [Match]
            Name = eth${num}

            [Network]
            DHCP = both
            LLMNR = true
            IPv4LL = true
            LLDP = true
            IPv6AcceptRA = true
            IPv6Token = ::521a:c5ff:fefe:65d9
            # used to have a stable address for zfs send
            Address = fd42:4492:6a6d:43:1::${num}/64

            [DHCP]
            UseHostname = false
            RouteMetric = 512
          '';
        }
      )
      {
        "0" = { };
        "1" = { };
        "2" = { };
        "3" = { };
      };

  imports = [
    ../nix-daemon.nix
    ../users
    (
      { ... }:
      {
        users.withSops = false;
      }
    )
  ];

  documentation.enable = false;

  documentation.info.enable = false;
  environment.systemPackages = with pkgs; [
    diskrsync
    partclone
    ntfsprogs
    ntfs3g
  ];

  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbBp2dH2X3dcU1zh+xW3ZsdYROKpJd3n13ssOP092qE joerg@turingmachine"
  ];

  # put this just to suppress the warning
  system.stateVersion = "22.11";
}
