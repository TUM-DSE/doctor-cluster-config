{
  lib,
  config,
  ...
}: let
  cert = ./certs + "/${config.networking.hostName}-cert.pub";
in {
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    useDns = false;
    # unbind gnupg sockets if they exists
    extraConfig = ''
      ${lib.optionalString (builtins.pathExists cert) ''
        HostCertificate ${cert}
      ''}
      StreamLocalBindUnlink yes
    '';
    # forwardX11 requires setXAuthLocation which in turn brings in X11
    # dependencies which i am not confident with bringing onto our servers.
    # see
    # https://github.com/NixOS/nixpkgs/blob/a664d2a42c26b5bf2bb214135502d66632e8f975/nixos/modules/services/networking/ssh/sshd.nix#L562W
    forwardX11 = false; 
  };

  warnings =
    lib.optional (! builtins.pathExists cert)
    "No ssh certificate found at ${toString cert}";

  programs.ssh.knownHosts."github.com" = {
    hostNames = ["github.com"];
    publicKey = ''
      ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
    '';
  };

  programs.ssh.knownHosts.ssh-ca = {
    certAuthority = true;
    hostNames = [
      "nfs"
      "nfs-backup"
      "*.r"
      "*.i"
      "*.thalheim.io"
      "*.dse.in.tum.de"
    ];
    publicKeyFile = ./certs/ssh-ca.pub;
  };
}
