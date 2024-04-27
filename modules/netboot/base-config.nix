{ config
, lib
, pkgs
, ...
}: {
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
      (num: _:
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
        })
      {
        "0" = { };
        "1" = { };
        "2" = { };
        "3" = { };
      };

  imports = [
    ../nix-daemon.nix
    ../users
    ({ ... }: {
      users.withSops = false;
    })
  ];

  documentation.enable = false;

  # no auto-updates
  systemd.services.update-prefetch.enable = false;

  documentation.info.enable = false;
  environment.systemPackages = with pkgs; [ diskrsync partclone ntfsprogs ntfs3g ];

  systemd.services.hidden-ssh-announce = {
    description = "irc announce hidden ssh";
    after = [ "tor.service" "network-online.target" ];
    wants = [ "tor.service" ];
    wantedBy = [ "multi-user.target" ];
    script = ''
      set -efu
      until test -e /var/lib/tor/onion/ssh/hostname; do
      echo "still waiting for /var/lib/tor/onion/ssh/hostname"
      sleep 1
      done
      echo "SSH Hidden Service at $(cat /var/lib/tor/onion/ssh/hostname)" | \
        ${config.nur.repos.mic92.ircsink}/bin/ircsink \
        --port=6697 --secure --server=irc.hackint.org --nick=nixos-installer --target="#krebs-announce"

    '';
    serviceConfig = {
      PrivateTmp = "true";
      User = "tor";
      Type = "oneshot";
    };
  };

  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];

  users.extraUsers.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbBp2dH2X3dcU1zh+xW3ZsdYROKpJd3n13ssOP092qE joerg@turingmachine"
  ];

  # put this just to suppress the warning
  system.stateVersion = "22.11";
}
