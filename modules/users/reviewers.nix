let
  extraGroups = [ "wheel" "docker" "input" ];
in {
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {

    # Reviewers for ushell artifact evaluation
    ushellRev1 = {
      isNormalUser = true;
      home = "/home/ushellRev1";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4010;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG56Z/2dBbSrYhh2hGyZbH+z18+MSbFoqSkMK1tUr3NV osdi26ae"];
      xrdpAccess = false;
      expires = "2026-07-01";
    };

    ushellRev2 = {
      isNormalUser = true;
      home = "/home/ushellRev2";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4011;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDF9C0ykOLWR21I54RxD/JV/Jo5Gs7m/xFNIHExQmrvcbYjaPOAH+wmBU48LwtHRdBRBXq/zgafJmz0GZIolBsjO0zITQ9EcleEuXHhLHlklnuROzxaOqRUJda9pBAgaQzpdXaSuCZy2gc+LkoJ2egzYLJjKkizIE6nZOBcjjB3cZhRaUe3rnQO4km9I++ovAMnNElwHaz4YypJ8LtxDhOm+ylpu2lfKWqZ5FeL7+8s1iT/a/V7kZ5MkfJvxuOqHuoKd+u5F6MjHC/SQXHS4bveJiBAqBnjZEIdum/cKz1Ba29hXAdSK4OmE7/jhiv8+p7yFfWos8XWI3dMIsbW7OlDQLjQxU5Rjf4Q9Uho8Tl/tW8puwlWTxqSQDlkG9rEeMw1ufmjO2CQUxYh4iscmncgPCScdJWhrsGSUmsciB5bfQRb0vOQ9BRBzMIc1VGF75A/nVFPBotseL0yu2/4/IeJ2V+ISl3WouDAvbFmhJTP4S8lLkZzOvJG1blEPSF4WxE= osdi26@Ubuntu22
"];
      xrdpAccess = false;
      expires = "2026-07-01";
    };

    ushellRev3 = {
      isNormalUser = true;
      home = "/home/ushellRev3";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4012;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFRlcr8LOQksTVCkz72/8//bovE+FXgc3D44VGJpsvaA maryam.ghorbanvirdi@gmail.com"];
      xrdpAccess = false;
      expires = "2026-07-01";
    };

    ushell_test = {
      isNormalUser = true;
      home = "/home/ushell_test";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4015;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJVzqi89INx1APSfhVdJj8HbDew4LZJzqDo931VdPAH3 nix-os-thinkpad"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    # Reviewers for Proteus artifact evaluation
    proteus1 = {
      isNormalUser = true;
      home = "/home/proteus1";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4000;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIElj3HHoA8A1VoEfsoZ+PCzS02UMYk3ZECP9ABhauD5q"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus2 = {
      isNormalUser = true;
      home = "/home/proteus2";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4001;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII+RyNU70t92GKIomkkj3LbtdVayrWQHsAHBRUGhwU9j"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus3 = {
      isNormalUser = true;
      home = "/home/proteus3";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4002;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO0shxs+OG4RA2xupSxkWVNLeEwWHe9NtvgnYpPdys7i"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus4 = {
      isNormalUser = true;
      home = "/home/proteus4";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4003;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBrzZVFvw2p2PhwDrdTg7VxcjbuKPil8pZQm4LRMOGUn"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus_test = {
      isNormalUser = true;
      home = "/home/proteus_test";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4004;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFU1ryXV37om9u3ezJYSf2ZdQ4NRUcQWKCN4ZuGwn1ku"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus5 = {
      isNormalUser = true;
      home = "/home/proteus5";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4005;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPUFEbnA6LBX9LTJhCF/fPNWd8LNmHZTOy4jxkoi5pKk"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus6 = {
      isNormalUser = true;
      home = "/home/proteus6";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4006;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOLsKU+W30s8mHfgjrB3HcPh7dYB19FHx8Dh09wJmg6a"];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

    proteus7 = {
      isNormalUser = true;
      home = "/home/proteus7";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4007;
      allowedHosts = [
        "momiji"
        "hinoki"
        "sakura"
      ];
      openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnp1xqp0+2SfgioqD5eufqWXOV9Kd2jvC2r5i4IehoqWF2fOQBicFzRdDVE1p288HLsLthdMN4PXDTU6eHJOFCye/0sXdAZyp+Au5+QgdVdnOoKq+Xgv+hz+YzBASxnDDoqY/CJQAXYYAUn9MbGaobN77BTj/01VZE2u6nGhqcXpvg4Qhb4s8SGLC16njEL30vSR+QUURrLhF4eoveaqoCUnx9WbQ6ZQsSgROyZIHsgrxPyC3rUYKZq2BA0WbNUm6RwOZjmQ7KaGvjQW2x+57FONY1GMtCl4ldm1ZkbJpQqHuRXul89kf+VrYlwYdZWcXhcmfitSHdx8TYQDo80QV+rkZwKtjePqUae7fzcekevsdyvx7elh6cjb36oWUhpDUVRonhDRWiJ3yGcDS633IDg7ljWlZf+rDV+p1Z95zcg25ciXcS3JRNu1Hj/rwjMfasQj1RbQ+2N7NNpX3K83UX1CDdhgeSGwGZqW4FNH22/USPxn9R9dEfYZYQhZmfCGk="];
      xrdpAccess = false;
      expires = "2026-04-01";
    };

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
  ];
}
