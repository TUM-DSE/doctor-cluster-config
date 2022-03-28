{
  # used in drone.thalheim.io
  users.users.ci = {
    isSystemUser = true;
    createHome = true;
    home = "/var/lib/ci";
    extraGroups = ["wheel"];
    shell = "/run/current-system/sw/bin/bash";
    uid = 1101;
    group = "ci";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPzCFVndhf5+81AiML9nJSrxEmoDGX2sf7hlCgd3am+G"
    ];
  };
  users.groups.ci = {};
}
