{
  imports = [
    ./modules/rasberrypi-4.nix
    ./modules/packages.nix
    ./modules/secrets.nix
    ./modules/tracing.nix
    ./modules/tor-ssh.nix
    ./modules/users.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/watchdog.nix
    ./modules/mosh.nix
    ./modules/r_reset.nix
  ];

  # port: 1/A/D14/1/14
  # mac address:
}
