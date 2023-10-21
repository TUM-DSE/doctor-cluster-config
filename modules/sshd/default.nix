{ lib
, config
, ...
}:
let
  cert = ./certs + "/${config.networking.hostName}-cert.pub";
in
{
  services.openssh = {
    enable = true;
    # unbind gnupg sockets if they exists
    extraConfig = ''
      ${lib.optionalString (builtins.pathExists cert) ''
        HostCertificate ${cert}
      ''}
      StreamLocalBindUnlink yes
    '';
    # X11Forwarding requires setXAuthLocation which in turn brings in X11
    # dependencies which i am not confident with bringing onto our servers.
    # see
    # https://github.com/NixOS/nixpkgs/blob/a664d2a42c26b5bf2bb214135502d66632e8f975/nixos/modules/services/networking/ssh/sshd.nix#L562W
    settings.X11Forwarding = false;
  };

  warnings =
    lib.optional (! builtins.pathExists cert &&
        config.networking.hostName != "nixos" # we dont care about nixos netboot/installer images
    )
      "No ssh certificate found at ${toString cert}";

  programs.ssh.knownHosts.ssh-ca = {
    certAuthority = true;
    hostNames = [
      "*.r"
      "*.i"
      "*.thalheim.io"
      "*.dos.cit.tum.de"
      # deprecated, remove soon
      "*.dse.in.tum.de"
    ];
    publicKeyFile = ./certs/ssh-ca.pub;
  };
}
