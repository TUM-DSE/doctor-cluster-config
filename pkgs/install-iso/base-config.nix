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

  # IPMI SOL console redirection stuff
  boot.kernelParams =
    (lib.optional (
      pkgs.stdenv.hostPlatform.isAarch32 || pkgs.stdenv.hostPlatform.isAarch64
    ) "console=ttyAMA0,115200")
    ++ (lib.optional (pkgs.stdenv.hostPlatform.isRiscV) "console=ttySIF0,115200")
    ++ [ "console=ttyS0,115200" ]
    # Prefer tty0 for console output as we mostly use the forwarding provided by the BMC
    # However we still enable serial tty access i.e. via ipmi sol
    ++ [ "console=tty0" ];

  boot.loader.grub.extraConfig = ''
    serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1
    terminal_input serial
    terminal_output serial
  '';

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

  environment.systemPackages = with pkgs; [
    diskrsync
    partclone
    ntfsprogs
    ntfs3g
    curl
    dnsutils
    gitMinimal # for flakes
    htop
    jq
    tmux
  ];

  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
}
