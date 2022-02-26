{ config, ... }:

let
  # add ssh keys here
in
{
  #OS management course users
  users.users = {
    # TeamA
    teama = {
      isNormalUser = true;
      home = "/home/teama";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4000;
      openssh.authorizedKeys.keys = [ ];
    };

    # TeamB
    teamb = {
      isNormalUser = true;
      home = "/home/teamb";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4001;
      openssh.authorizedKeys.keys = [ ];
    };

    # TeamC
    teamc = {
      isNormalUser = true;
      home = "/home/teamc";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4002;
      openssh.authorizedKeys.keys = [ ];
    };

    # TeamD
    teamd = {
      isNormalUser = true;
      home = "/home/teamd";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4003;
      openssh.authorizedKeys.keys = [ ];
    };

    # TeamE
    teame = {
      isNormalUser = true;
      home = "/home/teame";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4004;
      openssh.authorizedKeys.keys = [ ];
    };

    # TeamF
    teamf = {
      isNormalUser = true;
      home = "/home/teamf";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4005;
      openssh.authorizedKeys.keys = [ ];
    };
  };

  # to delete users after course end
  #users.deletedUsers = [
  #    "teama"
  #    "teamb"
  #    "teamc"
  #    "teamd"
  #    "teame"
  #    "teamf"
  #];
}
