{ config
, lib
, ...
}:
let
  joergsKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbBp2dH2X3dcU1zh+xW3ZsdYROKpJd3n13ssOP092qE joerg@turingmachine" ];

  okelmannKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDITBcN9iw5Fn7yyfgiWFet3QWDoMcUNtzLi+PNoYS7jksvcKZy5pLOjE6wCpkbYx+Tcb4MyvoWPXvwdo5FfL4XdhZRO+JlZ66p/rGssq/wEr2BBUwohP7o39JLtiyXGXSsK6MO2aceOFLQr4KAdaeD8ST0XumGcV6bGqIbjFsK5FCxFhO8NkCFtavBjDwKUm3uyOnVCWMp12abUphzxrVtWhcsnw5GapohATP03mCNxmrn/L7x393HutxgjyduScX7++MjwVE6J7wCnztPUtJbh9jYemr/K9fBMBbLhQagOjrlQYGU5frgmLrPCRZusyg5HjWx6gJIxs/DskfgmW+V"
  ];

  extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" "admin" ];
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
        hashedPasswordFile = lib.mkIf config.users.withSops config.sops.secrets.root-password-hash.path;
        openssh.authorizedKeys.keys = joergsKeys ++ okelmannKeys;
      };
    };

    nix.settings.trusted-users = [ "joerg" "okelmann" ];
  };
}
