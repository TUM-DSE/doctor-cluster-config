{ ... }:
let
  christianKKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfke0RoVMEtj0XjxdjatQgz0RQxs7gaGSgM2OoGBemO chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL7ghrJVl24UkfnyNOz21jbmrnPImp3+UR4/p2xymbnl chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDwlqdl/70dJ1ABKwLEdLB6/RDpfE4RVaB+xL3YJ1v3+ chris@kingpin"
  ];

  florianDKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzBXMrJs0r2uxG+LvG3gRf5hvMWlnW7x1A2klk+AfcyqTSWvVty51QaIcx9ioeJrS35Ohl9BCvwgKchCWHrHGMKCCgy5ghKZoRVPLeAa6R4lTK25p0rOu/3DkY0wm97/IVWP9GKhT0Ifyix6o9HNutHsP7s5TTVwr2ys4v1LtOareZDTtTOE44mvD9ECisVNSIcXHlnYQO8SAQ7HLJ/fZio577BXvgPVHq6OgVzypXeIYUEW1EAN/1c6pgUhIhZ0Nh38p2Owo1C84UyIdKZ6z5gS2xfi/9mXoxd71lZe68+LjKJvatfXdLI0tCNXO/aSZoIOg6l5+OYfnZPF8nqqmd D073556@WDFN34367251A"
  ];

  raduKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8+2IgrKrbXjVW5B2ApnA/O58t0/Dt5teYOO+LYI++3 rr@fedora"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQXz3kK3tTLQB2aHZ2IktVLfapJhKSjxwVOK8DNPwln rr@fedora"
  ];

  martinLiKeys = [
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBABCmZLhiHvPWTbyaInI0XBqpbHi5OUdymVr42r2ganFA/7eGfsTi4BN5heBmPkHlay5g/Pl1I0YYJsEF1tdIffqtAGn8riy6BK8cJ76ABl8ZSPQdoVlOuncXzn32BrjJ2kr9BAfCV21WeC2SfpCRYj3sCWZFA2PknSoEfh0kzOTEW22Vg== mrtn@nix-nb"
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBACZkmXdEDbg/5gtbANAYQfSaFKEluiGuQpa6MCA+msQIx2lr/1M7+Lmcf3sWG3kYyYJZFZ+6+sUmUFqgeJWN6jOogGSfK/OEyY/zKdrIqcSIsvoHREhG/10VXSbGWv+MS9FjxuT4AO40FLRF5pq8cGQgUcm3khAknF4yQ6TtJQyxU4OOw== mrtn@cronus"
  ];

  jakubKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuhXm9XnaDqxxYyGNEKBgwF5cgw+9NzMe0RjnOWWWVY399LmQr+MM4KRLs6KhRlXrG3nJ/ymc8ecY7wm79HECRmbg7HwfsJSE0cZSu+JR6HVOmwLJXYfPDL65TOf1HeSVGBrCmsnnbHBknodxsrcagLtM9yAVzClRLTylnmAzRBtHCVVqpyWlrkdLvfFDp+ddSMssjA06zrXOaasJl6BdGFnMnoa02sVh2/Fr2nsxOm/5WVnnrVEzIRw//a1Mzf/CL8YPAdtcoWNrms9lyc/i32X1Lxof8BreBLt6OskcAzSpYf5cHq1fBfSEig3yndWia1YPC0UKvSis7kABw9LyuyrbdD+VofSPsEJdqnDBMLUuH3Qw3m/KyzGBG+AfjBgj+LsjgS6ZV/dZ5Liyse0PGhpF1UmUvhS/5IEN1aETlikWU2Sq7sBDPWVWOrLLY6WRtpOFLeCqP527oY3OJPVI4B3vAOlKnzsMdJmL262f9hQJwRq6YLNhDh4Tp3mXR0Ms= jakubantoni1@gmail.com"
  ];

  alexKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFvpwaPg39D9JvEtzKbCUAfYxLjSU2bCg+zCb+N0iI3P alex.bartelt@tum.de"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMTtPXwCUQXXoSzTGphI5zyvgkNaPr+mUGh8begbUI8z alex.bartelt@tum.de"
  ];

  marklKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAION7iphhIKOVJ1XgdUZfjdvfxbxa8nTudbHb4QnD0nck kilianm@eris"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOt8GnOlC14rFzJaTe/R8tnRwVZd+myw84GkakVn+TSH kilianm@sedna"
  ];

  wangcKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsL3xmJQaFDcQW4z267XU+IkVG/v3xVGfjEWopZ41// wangc@DESKTOP-H7SJ4J3"
  ];

  diegoKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMkWoCSEZ9snNafLouS66P7VSPUdkD5haLMTGE3lvd4w diegosanchez@diego-hplaptop15da0xxx"
  ];

  minyaoKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII6NPDc3iWN4ClsPLYzEARLAKhF0vkYhJSYOPVmnEysg minyao@minyaodeMacBook-Air.local"
  ];

  pyuhalaKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM9iLGmi0efAp3bbx8epXkmdxf7msqJQqrhywZWiJYcI petersonyuhala@gmail.com"
  ];

  sebastianroggKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7bi9+G3iAqkye5M4wL5qi4A+BoToLd1kmoAka4EEBe sebastianrogg-defer"
  ];

  florianKeys = [
    "ssh-ed25519 AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIIRNKR0dU1OVVLPrGCCWR7LkBEtcV+bvDdx3uG7/DvkpAAAACXNzaDpsb2dpbg==  sk-ssh-ed25519@openssh.com"
    "ssh-ed25519 AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIB2L5+55IgmPP3rw5XAbbQYAM1wHyDXhah2XBFq3krzWAAAACXNzaDpsb2dpbg==  sk-ssh-ed25519@openssh.com"
  ];

  extraGroups = [
    "wheel"
    "docker"
    "plugdev"
    "vboxusers"
    "adbusers"
    "input"
    "student"
    "video"
  ];
in
{
  # for new students please use a uid in the range between 2000-3000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Christian Krinitsin, GR student with Theofilos.
    christianK = {
      isNormalUser = true;
      home = "/home/christianK";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2076;
      allowedHosts = [
        "yasmin"
        "graham"
        "jamie"
        "eliza"
        "ian"
      ];
      openssh.authorizedKeys.keys = christianKKeys;
      expires = "2026-12-31";
    };

    # DB chair PhD working on compiler stuff. Uses the Risc V board for experiments
    # Ask Ilya before removing :pray:
    florianD = {
      isNormalUser = true;
      home = "/home/florianD";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2085;
      allowedHosts = [
        "graham"
        "tegan"
      ];
      openssh.authorizedKeys.keys = florianDKeys;
      expires = "2027-11-06";

    };

    # Radu Raceala (GR with Simon/Ilya)
    radu = {
      isNormalUser = true;
      home = "/home/radu";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2093;
      allowedHosts = [
        "steve"
        "eliza"
        "joy"
        "clockwork"
      ];
      openssh.authorizedKeys.keys = raduKeys;
      expires = "2027-05-31";
    };

    # Martin Lindbuechl, MSc student working w/ Ilya (can be removed after June 2027)
    mrtn = {
      isNormalUser = true;
      home = "/home/mrtn";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2104;
      allowedHosts = [
        "irene"
        "steve"
        "eliza"
        "joy"
        "clockwork"
      ];
      openssh.authorizedKeys.keys = martinLiKeys;
      expires = "2027-05-31";
    };

    # Jakub Gonera (GR w/ Martin)
    jakub = {
      isNormalUser = true;
      home = "/home/jakub";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2105;
      allowedHosts = [
        "graham"
        "eliza"
      ];
      openssh.authorizedKeys.keys = jakubKeys;
      expires = "2026-11-30";
    };

    # Alexander Bartelt, Bsc thesis working w/ Sebastian (can be removed after October 2026)
    alex = {
      isNormalUser = true;
      home = "/home/alex";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2107;
      allowedHosts = [
        "graham"
        "eliza"
      ];
      openssh.authorizedKeys.keys = alexKeys;
      expires = "2026-12-30";
    };

    # Diego Lopez, GR w/ Aleksandra (can be removed after Feb 2027)
    diego = {
      isNormalUser = true;
      home = "/home/diego";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2013;
      allowedHosts = [
        "rose"
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = diegoKeys;
      expires = "2027-03-01";
    };

    # Kilian Markl, MSc thesis working w/ Anders (can be removed after Jan 2027)
    markl = {
      isNormalUser = true;
      home = "/home/markl";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2113;
      allowedHosts = [
        "graham"
      ];
      openssh.authorizedKeys.keys = marklKeys;
      expires = "2027-03-01";
    };

    # Chuyang Wang, BSc thesis w/ Masa and Sandro (can be removed after March 2027)
    wangc = {
      isNormalUser = true;
      home = "/home/wangc";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2114;
      allowedHosts = [
        "ian"
      ];
      openssh.authorizedKeys.keys = wangcKeys;
      expires = "2027-03-31";
    };

    # Min-Yao Chang, BSc exchange student w/ Teofil (can be removed after March 2027)
    minyao = {
      isNormalUser = true;
      home = "/home/minyao";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2115;
      allowedHosts = [
        "vislor"
      ];
      openssh.authorizedKeys.keys = minyaoKeys;
      expires = "2027-03-31";
    };

    # Peterson Yuhala, UBC PostDoc working with Reto (can be removed at the end of 2027)
    pyuhala = {
      isNormalUser = true;
      home = "/home/pyuhala";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2116;
      allowedHosts = [
        "xavier"
      ];
      openssh.authorizedKeys.keys = pyuhalaKeys;
      expires = "2027-12-31";
    };

    # Sebastian Rogg, BSc thesis w/ Peter W. (can be removed after Mai 2027)
    sebastianrogg = {
      isNormalUser = true;
      home = "/home/sebastianrogg";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2333;
      allowedHosts = [
        "jamie"
        "steve"
      ];
      openssh.authorizedKeys.keys = sebastianroggKeys;
      expires = "2027-04-30";
    };

    # Florian Freudiger, MSc thesis w/ Sandro and Masa (can be removed after May 2027)
    florian = {
      isNormalUser = true;
      home = "/home/florian";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2033;
      allowedHosts = [
        "ian"
        "clara"
      ];
      openssh.authorizedKeys.keys = florianKeys;
      expires = "2027-05-30";
    };
  };

  # DANGER ZONE!
  # - Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  # - If you reactivate a user, then make sure to use the same uid as before
  # to avoid any permission issues
  # - Garbage collect deleted users manually one year after deletion to free the username again
  users.deletedUsers = [
    "andrei"
    "senad"
    "maurice"
    "tunc"
    "hernan"
    "anton"
    "steve"
    "max"
    "yongjie"
    "johanna"
    "chris"
    "leon"
    "jakob"
    "sandra"
    "samuel"
    "simonw"
    "ivanl"
    "alexa"
    "alexander"
    "alexandermaslew"
    "alp"
    "anand"
    "benedikt"
    "berkay"
    "christian"
    "dmitrylugovoy"
    "eaypek"
    "eliza"
    "emil"
    "fritz"
    "hanwenliu"
    "he"
    "iulia"
    "jasper"
    "jonas"
    "justus"
    "justusvonderbeek"
    "kai"
    "kamilk"
    "kilian"
    "konrad"
    "konradH"
    "konstantin"
    "lan"
    "luca"
    "m00wl"
    "mfaltus"
    "mflatus"
    "mikilio"
    "milen"
    "ml"
    "moritz"
    "mwerndle"
    "nicola"
    "osman"
    "paul"
    "paulz"
    "philip"
    "phillip"
    "raito"
    "raphael"
    "robert"
    "roberto"
    "rohan"
    "s1443541"
    "sarac"
    "simond"
    "timo"
    "tristan"
    "turkmen"
    "vanda"
    "victor"
    "vincent"
    "wonbangseo"
    "yihe"
    "yiwenliu"
    "zixuan"
    "bruno"
    "thang"
    "martinL"
    "janhe"
    "janha"
    "hristina"
    "hendrik"
    "bruno"
    "kchristian"
    "hristinag"
    "sherif"
    "nima"
    "etienne"
    "shu"
    "laurent"
    "dominik"
    "robertB"
    "iljag"
    "benedikt2"
    "micha2"
    "yves"
    "neel"
    "neelm"
    "deniz"
    "marc"
    "martinLi"
  ];

}
