{ lib
, pkgs
, config
, ...
}: {
  system.stateVersion = config.system.nixos.version;

  networking.firewall.enable = false;

  networking.usePredictableInterfaceNames = false;
  systemd.network.enable = true;
  networking.useNetworkd = true;

  systemd.network.networks =
    lib.mapAttrs'
      (num: _:
        lib.nameValuePair "eth${num}" {
          matchConfig.Name = "eth${num}";
          networkConfig = {
            DHCP = "yes";
            LLMNR = true;
            IPv4LLRoute = true;
            LLDP = true;
            IPv6AcceptRA = true;
            # used to have a stable address for zfs send
            Address = "fd42:4492:6a6d:43:1::${num}/64";
          };
          dhcpConfig = {
            UseHostname = false;
            RouteMetric = 512;
          };
          ipv6AcceptRAConfig.Token = "::521a:c5ff:fefe:65d9";
        })
      {
        "0" = { };
        "1" = { };
        "2" = { };
        "3" = { };
      };

  imports = [
    ../../modules/users
  ];

  sops.defaultSopsFile = ./secrets.yml;
  sops.secrets.root-password-hash = {};

  documentation.enable = false;
  documentation.nixos.options.warningsAreErrors = false;

  # no auto-updates
  systemd.services.update-prefetch.enable = false;

  environment.systemPackages = with pkgs; [
    diskrsync
    partclone
    ntfsprogs
    ntfs3g
  ];

  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
}
