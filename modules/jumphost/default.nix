{
  config,
  lib,
  pkgs,
  ...
}:
{
  # defined in astrid's secrets
  sops.secrets.deploy-ssh-key = { };

  programs.ssh.knownHosts."login.dos.cit.tum.de" = {
    hostNames = [ "login.dos.cit.tum.de" ];
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJiLBCN41dSG/45o5/h/56VF02nRVWe2ssTbE7VrxZOA";
  };

  systemd.services.update-authorized-keys =
    let
      sshKeysUnfiltered = builtins.concatLists (
        lib.mapAttrsToList (_: user: user.openssh.authorizedKeys.keys) config.users.users
      );
      sshKeys = (import ../lawful-access/util.nix { inherit config lib; }).filter sshKeysUnfiltered;
      authorizedKeys = pkgs.writeText "authorized-keys" (builtins.concatStringsSep "\n" sshKeys);
    in
    {
      description = "Update authorized keys on login.dos.cit.tum.de";
      wantedBy = [ "multi-user.target" ];
      script = ''
        ${pkgs.openssh}/bin/ssh -T -v -i $CREDENTIALS_DIRECTORY/deploy-keys deploy-keys@login.dos.cit.tum.de < ${authorizedKeys}
      '';
      serviceConfig = {
        Type = "oneshot";
        DynamicUser = true;
        User = "deploy-keys";
        LoadCredential = "deploy-keys:${config.sops.secrets.deploy-ssh-key.path}";
        RemainAfterExit = "yes";
      };
    };
}
