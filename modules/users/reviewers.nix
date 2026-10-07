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
      uid = 4016;
      inherit extraGroups;
      allowedHosts = [
        "vislor"
      ];
      openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIdZhGHv8KmIqRvColCrRwGJSsMZp7TojZvXO0IUeKLbn9IDVefgNq352dW7/LhQUK6Pda/ukPiBf/B0pzlqt9R5gYfrV6tcQkEaVcNOLj14s0SMQ7tPwgah1W8KddMNnA5+xZ7n8rWRUuYpMdXX+1QokxFLJCEDERXbTZ/CzFjrjalsAWv0IeaxMzq+Z2HfuKTmMnEGH56BTYkF+iayddtV00ZR5pOMZhtL4pkhFYTSnZpn9GEeSSpFx2nKCvf+iVN0h4umtSmL5d1cgZ4cBhKPsjIAfaqitzcoerEWSM0yMGowXyBPJyTbjrtYcv9dG/g7mdLtkXzBfxDf021/QQpotVty5OwsdWC3KW5EJKRseGYWV7dIQA9QSR6dJI7FatoJBAXeM8+XiHYFEfa4Lm3Z5OEn4tft1pMWRbk8t/orWWz88UtXS3xCBh2UQlWS0H/4BDE9cGJ/si/YjCBFBXJ+KA1mxNMByyHpB4SgNnrta+DRRwBtLF6iF73HWi9UP+jDQaLzzl+eCKPpWtJXGIYYyV7oJXAm0nsdS1WbyTo1PO4rhuowe89e4H7GuvecbWwA6vAZaFCX0cfMzwgzpT6Pmf2hpHF+j7rFlTa1qLW+3/FvkkMr3uictL6HEy/YagtjQUNfE1lqb/tJeRens5ss4GlvzjYMi/S8mrWHa5yw=="];
      expires = "2026-08-01";
    };

    cvmstore1 = {
      isNormalUser = true;
      home = "/home/cvmstore1";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4017;
      inherit extraGroups;
      allowedHosts = [
        "vislor"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJj9qn7zAwmQmwWjrqJRZVrwhuwfrLXGKZB+fPR4AKr"];
      expires = "2026-10-30";
    };

    cvmstore2 = {
      isNormalUser = true;
      home = "/home/cvmstore2";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4018;
      inherit extraGroups;
      allowedHosts = [
        "vislor"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyln/6skEj9CVOzo2xv6HDY6QhRYg+m1uZF5eQchvZD"];
      expires = "2026-10-30";
    };
    focacciaRevA = {
      isNormalUser = true;
      home = "/home/focacciaRevA";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4019;
      inherit extraGroups;
      allowedHosts = [
        "eliza"
	"adelaide"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPCxMNnGtqCx1yf166b6lsfIzTS54I7KwH7+8Zf7IXM7"];
      expires = "2026-11-30";
    };
    focacciaRevB = {
      isNormalUser = true;
      home = "/home/focacciaRevB";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4020;
      inherit extraGroups;
      allowedHosts = [
        "eliza"
	"adelaide"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGwFcz8vOBJyKsuiLYoySnVFSF7EAsCm8P89BNgb6luS"];
      expires = "2026-11-30";
    };
    focacciaRevC = {
      isNormalUser = true;
      home = "/home/focacciaRevC";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4021;
      inherit extraGroups;
      allowedHosts = [
        "eliza"
	"adelaide"
      ];
      openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgYTyg+BwGTA3tmcAyZ3azop/KjZQ6/hTszxAsQEjIOdzC1WmZcOrFvJwMYuwe3OKWjVLCGD4XtjJSwN1dys7PM8e2nAtzCkPbrGVp+A/V6YGC0JnEHlYSVoYJxnxJR9PhqLop1BljCtLtAto8fenJCHLc2yzy0QUp6+NhFR9QcJn0Jhlq8v34C3mQzgy/vFNSYWwY+U/b9oatZty7HKP4oFB9P2kyYmN0AW00e+WIGr5okaUivJvBPaeOtqVDJZaTJIghmjOXmXTU/RmiQIq4iMRVy0tDjtESwJ8Y0UtUhOa3Eh7NsKKHtsGNajXTcqXsN64jsZkcEE6KQV+NbybXO6NBzpIQ3vkowsYbQ2spjpxZ5MiST+tVyRWKPsPQFs2K0eXSsMVBFil/8IhhtjNFJLRT3rBxzhx3v+FDvuZqzTDz62Dgylf9HilyvtA1vT9Z548RvTnzTcbZl5avZ1fxI1kPetCntCrqTN0EtoKfoTVNurnO2z3Wg+ZQoFssZnxSsi9GSIQRuRmHm+TAW1QMJr93HygBeR+Y0QM6iKAAmeut+KewxEWOuju+e09VvDn3WosCu9Qb44471+E6J7Pms8aYSGTRI53En3xaBYGTq/kC9X2ZlrPUM/v98lVOdGVYb8DLXari8iQsYEylAsxM/EG9/A0rcn20kfubeH3oYw== reviewer"];
      expires = "2026-11-30";
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
