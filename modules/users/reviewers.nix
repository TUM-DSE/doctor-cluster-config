let
  extraGroups = [ "wheel" "docker" "input" ];
in {
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
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
