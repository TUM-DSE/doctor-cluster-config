let
  extraGroups = [ "wheel" "docker" "input" ];
in {
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {

    gergonemeth = {
      isNormalUser = true;
      home = "/home/gergonemeth";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4008;
      inherit extraGroups;
      allowedHosts = [
        "ryan"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxgj1VQLrGGVRVwk4wEw3t13Yx0BuslofrZYqGYEngd gergonemeth"];
      expires = "2026-08-01";
    };

    btbferret1 = {
      isNormalUser = true;
      home = "/home/btbferret1";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4009;
      inherit extraGroups;
      allowedHosts = [
        "jamie"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPJg3dQSL7NXMBTWxOYvoecR65Qo/TCpC1e5Pd8VlB5T btbferret1"];
      expires = "2026-09-01";
    };

    btbferret2 = {
      isNormalUser = true;
      home = "/home/btbferret2";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4010;
      inherit extraGroups;
      allowedHosts = [
        "jamie"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfmK0t9PXFJ+NhSQ4r0biriq7f+694olUQrl4sVb7Qy btbferret2"];
      expires = "2026-09-01";
    };

    ccsRev1 = {
      isNormalUser = true;
      home = "/home/ccsRev1";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4011;
      inherit extraGroups;
      allowedHosts = [
        "vislor"
      ];
      openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIdZhGHv8KmIqRvColCrRwGJSsMZp7TojZvXO0IUeKLbn9IDVefgNq352dW7/LhQUK6Pda/ukPiBf/B0pzlqt9R5gYfrV6tcQkEaVcNOLj14s0SMQ7tPwgah1W8KddMNnA5+xZ7n8rWRUuYpMdXX+1QokxFLJCEDERXbTZ/CzFjrjalsAWv0IeaxMzq+Z2HfuKTmMnEGH56BTYkF+iayddtV00ZR5pOMZhtL4pkhFYTSnZpn9GEeSSpFx2nKCvf+iVN0h4umtSmL5d1cgZ4cBhKPsjIAfaqitzcoerEWSM0yMGowXyBPJyTbjrtYcv9dG/g7mdLtkXzBfxDf021/QQpotVty5OwsdWC3KW5EJKRseGYWV7dIQA9QSR6dJI7FatoJBAXeM8+XiHYFEfa4Lm3Z5OEn4tft1pMWRbk8t/orWWz88UtXS3xCBh2UQlWS0H/4BDE9cGJ/si/YjCBFBXJ+KA1mxNMByyHpB4SgNnrta+DRRwBtLF6iF73HWi9UP+jDQaLzzl+eCKPpWtJXGIYYyV7oJXAm0nsdS1WbyTo1PO4rhuowe89e4H7GuvecbWwA6vAZaFCX0cfMzwgzpT6Pmf2hpHF+j7rFlTa1qLW+3/FvkkMr3uictL6HEy/YagtjQUNfE1lqb/tJeRens5ss4GlvzjYMi/S8mrWHa5yw=="];
      expires = "2026-08-01";
    };
};

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "risotto"
    "sppRev1"
    "sppRev2"
    "sppRev3"
    "atcRev1"
    "atcRev2"
    "atcRev3"
    "cgo25Rev"
    "cgoPixel8"
    "conextRev1"
    "conextRev2"
    "conextRev3"
    "fastRev1"
    "fastRev2"
    "fastRev4"
    "fastRev5"
    "nsdiRev1"
    "nsdiRev2"
    "nsdiRev3"
    "nsdiRev4"
    "vcxlgenRev1"
    "vcxlgenRev2"
    "vcxlgenRev3"
    "aranciniRev1"
    "aranciniRev2"
    "ushellRev1"
    "ushellRev2"
    "ushellRev3"
    "ushell_test"
    "proteus1"
    "proteus2"
    "proteus3"
    "proteus4"
    "proteus_test"
    "proteus5"
    "proteus6"
    "proteus7"
  ];
}
