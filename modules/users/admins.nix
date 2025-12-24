{ config, lib, ... }:
let
  joergsKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLMlGNda7bilB0+3aMeJSFcB17auBPV0WhW60WlGZsQRF50Z/OgIHAA0/8HaxPmpIOLHv8JO3dCsj+OY1iS4FNo= joerg@turingmachine"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCsjXKHCkpQT4LhWIdT0vDM/E/3tw/4KHTQcdJhyqPSH0FnwC8mfP2N9oHYFa2isw538kArd5ZMo5DD1ujL5dLk= ssh@secretive.Joerg's-Laptop.local"
  ];

  okelmannKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDITBcN9iw5Fn7yyfgiWFet3QWDoMcUNtzLi+PNoYS7jksvcKZy5pLOjE6wCpkbYx+Tcb4MyvoWPXvwdo5FfL4XdhZRO+JlZ66p/rGssq/wEr2BBUwohP7o39JLtiyXGXSsK6MO2aceOFLQr4KAdaeD8ST0XumGcV6bGqIbjFsK5FCxFhO8NkCFtavBjDwKUm3uyOnVCWMp12abUphzxrVtWhcsnw5GapohATP03mCNxmrn/L7x393HutxgjyduScX7++MjwVE6J7wCnztPUtJbh9jYemr/K9fBMBbLhQagOjrlQYGU5frgmLrPCRZusyg5HjWx6gJIxs/DskfgmW+V"
  ];

  extraGroups = [
    "wheel"
    "docker"
    "plugdev"
    "vboxusers"
    "adbusers"
    "input"
    "video"
    "admin"
  ];
in
{
  config = {
    users.users = {
      # Jörg Thalheim
      # tum
      joerg = {
        isNormalUser = true;
        home = "/home/joerg";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1000;
        openssh.authorizedKeys.keys = joergsKeys;
        xrdpAccess = true;
      };

      # Peter Okelmann
      # tum
      okelmann = {
        isNormalUser = true;
        home = "/home/okelmann";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1008;
        openssh.authorizedKeys.keys = okelmannKeys;
      };

      root = {
        initialHashedPassword = lib.mkIf config.users.withSops null;
        hashedPasswordFile = lib.mkIf config.users.withSops config.sops.secrets.root-password-hash.path;
        openssh.authorizedKeys.keys = joergsKeys ++ okelmannKeys;
      };
    };

    nix.settings.trusted-users = [
      "joerg"
      "okelmann"
    ];
  };
}
