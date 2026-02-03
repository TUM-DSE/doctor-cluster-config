{ config, lib, ... }:
let
  joergsKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLMlGNda7bilB0+3aMeJSFcB17auBPV0WhW60WlGZsQRF50Z/OgIHAA0/8HaxPmpIOLHv8JO3dCsj+OY1iS4FNo= joerg@turingmachine"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCsjXKHCkpQT4LhWIdT0vDM/E/3tw/4KHTQcdJhyqPSH0FnwC8mfP2N9oHYFa2isw538kArd5ZMo5DD1ujL5dLk= ssh@secretive.Joerg's-Laptop.local"
  ];

  okelmannKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDITBcN9iw5Fn7yyfgiWFet3QWDoMcUNtzLi+PNoYS7jksvcKZy5pLOjE6wCpkbYx+Tcb4MyvoWPXvwdo5FfL4XdhZRO+JlZ66p/rGssq/wEr2BBUwohP7o39JLtiyXGXSsK6MO2aceOFLQr4KAdaeD8ST0XumGcV6bGqIbjFsK5FCxFhO8NkCFtavBjDwKUm3uyOnVCWMp12abUphzxrVtWhcsnw5GapohATP03mCNxmrn/L7x393HutxgjyduScX7++MjwVE6J7wCnztPUtJbh9jYemr/K9fBMBbLhQagOjrlQYGU5frgmLrPCRZusyg5HjWx6gJIxs/DskfgmW+V"
  ];

  anatoleKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqbnkl4OVgJGhO/CRhPnnMCsHGAE77jnbpWMoCLniKNgqLVwPBpevfJed9gwmrUdUKnAdvKP/+EIUMydjqC1VkYVXB0oNWd372hpxOmu9lYziXwQA7m0R2b8VhKwE3KXg2kZfDq8vW35ZQ5F/jGmMwBVSRuYP2cBo0BBMlEniYhgiPlUT7TzPttx0TmSCDUCj9CaSZ3rAGbyjT7ezcFFAQQEMd0EYvSa04B12EpYNLKf1rIcMrEEOUn7pwwF1kbpSLvVeP+0FnxokxiSlKKCKNMB2igE4ahJI2XH2HMTb20Ce/NKwGU79ZwWnwtsjXJV+qoqmh5VSyzKlwfBvELLNR anatole@MSI_GX740"
  ];

  thoreKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQCP93wmHUCOKn5W42KnzyBQBjltRp5RU23WbAMlgy5 TUM"
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

      # Thore Sommer: wants to improve monitoring
      thore = {
        isNormalUser = true;
        home = "/home/thore";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/fish";
        uid = 2030;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = thoreKeys;
      };

      # Anatole Lefort: Works on web stuff for students hosted on the monitoring VM
      anatole = {
        isNormalUser = true;
        home = "/home/anatole";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1031;
        openssh.authorizedKeys.keys = anatoleKeys;
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
