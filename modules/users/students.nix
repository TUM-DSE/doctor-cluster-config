{ ... }:
let
  christianKKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfke0RoVMEtj0XjxdjatQgz0RQxs7gaGSgM2OoGBemO chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL7ghrJVl24UkfnyNOz21jbmrnPImp3+UR4/p2xymbnl chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDwlqdl/70dJ1ABKwLEdLB6/RDpfE4RVaB+xL3YJ1v3+ chris@kingpin"
  ];

  jannikKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcGR16x/38pzE7bidJu8Ow778pogCqN2U9h5Y6LZ8Xj jannik@jannik-ThinkPad-E15-Gen-2"
  ];

  florianDKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzBXMrJs0r2uxG+LvG3gRf5hvMWlnW7x1A2klk+AfcyqTSWvVty51QaIcx9ioeJrS35Ohl9BCvwgKchCWHrHGMKCCgy5ghKZoRVPLeAa6R4lTK25p0rOu/3DkY0wm97/IVWP9GKhT0Ifyix6o9HNutHsP7s5TTVwr2ys4v1LtOareZDTtTOE44mvD9ECisVNSIcXHlnYQO8SAQ7HLJ/fZio577BXvgPVHq6OgVzypXeIYUEW1EAN/1c6pgUhIhZ0Nh38p2Owo1C84UyIdKZ6z5gS2xfi/9mXoxd71lZe68+LjKJvatfXdLI0tCNXO/aSZoIOg6l5+OYfnZPF8nqqmd D073556@WDFN34367251A"
  ];

  raduKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8+2IgrKrbXjVW5B2ApnA/O58t0/Dt5teYOO+LYI++3 rr@fedora"
  ];

  hernanKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMowVBAs878BvU469/2lPFGrUYHv6t68w6p1m9BKPTG6 hernanl.leon@huawei.com"
  ];

  martinLiKeys = [
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBABCmZLhiHvPWTbyaInI0XBqpbHi5OUdymVr42r2ganFA/7eGfsTi4BN5heBmPkHlay5g/Pl1I0YYJsEF1tdIffqtAGn8riy6BK8cJ76ABl8ZSPQdoVlOuncXzn32BrjJ2kr9BAfCV21WeC2SfpCRYj3sCWZFA2PknSoEfh0kzOTEW22Vg== mrtn@nix-nb"
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBACZkmXdEDbg/5gtbANAYQfSaFKEluiGuQpa6MCA+msQIx2lr/1M7+Lmcf3sWG3kYyYJZFZ+6+sUmUFqgeJWN6jOogGSfK/OEyY/zKdrIqcSIsvoHREhG/10VXSbGWv+MS9FjxuT4AO40FLRF5pq8cGQgUcm3khAknF4yQ6TtJQyxU4OOw== mrtn@cronus"
  ];

  mauriceKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2BTsVv0YJ48wrV0s9SL4rGJPjaj/vTGMRUExAH9Sj4 db-gitlab"
  ];

  tuncKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+deOcBdufU6Ug+T9DflHrBeQ9cBo6Yl/YjQ+22CaLsd8ZF60nAUQddwu5VXGs5gcK2IUtL9UUpuWgMhSrQHJ5K5Bh1fYQsLFmiH5TFfQAQhO9UIwlJTy8+H89R07Lbro0wWe3/eVf0sAqtlkmcnjZuGg43eJ3sMFtjcwU9w+KZs1lQhC4v/D0W264ZOs+I8FhWCWab7aZMWm7UTxJmc6aq4mcOzqNnMBQarQmjIvVIO3kfsUtyj9ZmfW5hLsF0miB1Gol+W6ZpoK44UorMJN5tUNdoT8jz4Cze4Ohe+rXDgoygvIX7uw6R9eJ4mi9zrl0itEnLHhdPs4CnltrIyAMFauotbp8S1PhUnLTGot2kjJ/0QmG+KkSDKHa8UuMqE76kpxhZ+EbqI03dpFCyl2/7VKiybNwfPyRX7P0ZwFEpoCJt5ckYPnLViNka9HvTg9rk22ofVXshNcX76BpVankSdm18rNzXj3B8Ggd3ue3+lnVzsB9Zz0hKc3njq5j1hU= batu6@Batu"
  ];

  jakubKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuhXm9XnaDqxxYyGNEKBgwF5cgw+9NzMe0RjnOWWWVY399LmQr+MM4KRLs6KhRlXrG3nJ/ymc8ecY7wm79HECRmbg7HwfsJSE0cZSu+JR6HVOmwLJXYfPDL65TOf1HeSVGBrCmsnnbHBknodxsrcagLtM9yAVzClRLTylnmAzRBtHCVVqpyWlrkdLvfFDp+ddSMssjA06zrXOaasJl6BdGFnMnoa02sVh2/Fr2nsxOm/5WVnnrVEzIRw//a1Mzf/CL8YPAdtcoWNrms9lyc/i32X1Lxof8BreBLt6OskcAzSpYf5cHq1fBfSEig3yndWia1YPC0UKvSis7kABw9LyuyrbdD+VofSPsEJdqnDBMLUuH3Qw3m/KyzGBG+AfjBgj+LsjgS6ZV/dZ5Liyse0PGhpF1UmUvhS/5IEN1aETlikWU2Sq7sBDPWVWOrLLY6WRtpOFLeCqP527oY3OJPVI4B3vAOlKnzsMdJmL262f9hQJwRq6YLNhDh4Tp3mXR0Ms= jakubantoni1@gmail.com"
  ];

  alexKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFvpwaPg39D9JvEtzKbCUAfYxLjSU2bCg+zCb+N0iI3P alex.bartelt@tum.de"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMTtPXwCUQXXoSzTGphI5zyvgkNaPr+mUGh8begbUI8z alex.bartelt@tum.de"
  ];

  senadKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICCm6mZLXct96cSF6xcM1BFrNcQe6AamFk7MEPaqZ+zJ senadlg gpu access"
  ];

  marklKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAION7iphhIKOVJ1XgdUZfjdvfxbxa8nTudbHb4QnD0nck kilianm@eris"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOt8GnOlC14rFzJaTe/R8tnRwVZd+myw84GkakVn+TSH kilianm@sedna"
  ];

  andreiKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCc6kci58KP0YherG/i+yLZg5w5+EoVDSdPwp2rbEVRX2zn0ZuEruSFd1S0xR3oucXJnu7a4HlfdOn9eBJsIXr9MB2PJA0KSHUz1hN5RwpwuYO/KoWKQeKgDoHb5cydWKzrL+PsD15rs0Inq/AAHRwEELW6hQuCnuyzhC6HI4phYHgd3QZxahvMCaLz2C1Wwp3m/v0xkjG/0fjyBxyrcwNSeL/YINSNOKnXkKkZtAnSBCOPiQuHE+TpM3UedzlNHCGHRkwlTbHxpeHzB/bD5RV1oDmcnrjfHubszD7KjjkK3fRPb2TgQ8jeovwaclve2Dfh87bp1dqFOARL59wlmLVGlGi3ADkB2PiEu0zkAVjoXimRXw2J7SrOS1UvGlhbPEu7Y1PCjg6hkIZhWnxwJlOZRBLKCQf6P9wlrm/hAhvKr+rauU7tz0RlY2S5eXSBMDtQuGLWwzZDFoukDv1BLPTY0p4ya6AdryvZyMIlsIcDG45Am+rGxZcMGUNtvzda+CJhILr2P51xp6v/yZVDRNHsEhiBFEIHKleNL8/ZFZksnQ93b2kGg8VFYPb6M9RC50Vy/oNY6FxJCqzk6Q7CymXTlSSYeIWPlBekyvnOgder26hcg+nhxY0kZIlhsdjCCDaJoiu/rYXgIBW0M6yjmcH9I1l3pTISjZuN3fl5Uu2QnQ== dabokva@gmail.com"
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

    # Jannik Pflieger, quantum hiwi SS25/ MSc thesis with Aleksandra and Manos
    jannik = {
      isNormalUser = true;
      home = "/home/jannik";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2080;
      allowedHosts = [
        "jamie"
        "graham"
      ];
      openssh.authorizedKeys.keys = jannikKeys;
      xrdpAccess = false;
      expires = "2026-07-01";
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
        "wilfred"
        "river"
        "christina"
        "adelaide"
        "jackson"
        "joy"
      ];
      openssh.authorizedKeys.keys = raduKeys;
      expires = "2026-10-31";
    };

    # Hernan Ponce de Leon (Collaborator with Sebastian)
    hernan = {
      isNormalUser = true;
      home = "/home/hernan";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2096;
      allowedHosts = [
        "graham"
        "eliza"
      ];
      openssh.authorizedKeys.keys = hernanKeys;
      expires = "2026-10-31";
    };

    # Martin Lindbuechl, GR student working w/ Ilya
    martinLi = {
      isNormalUser = true;
      home = "/home/martinLi";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2065;
      allowedHosts = [
        "irene"
        "polly"
        "xavier"
        "joy"
      ];
      openssh.authorizedKeys.keys = martinLiKeys;
      expires = "2027-03-30";
    };

    # Maurice Scholtes, GR student working w/ Ilya (can be removed after October 2026)
    maurice = {
      isNormalUser = true;
      home = "/home/maurice";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2100;
      allowedHosts = [
        "irene"
        "polly"
        "xavier"
      ];
      openssh.authorizedKeys.keys = mauriceKeys;
      expires = "2026-10-30";
    };

    # Tunc Batu Basaran (B.Sc. thesis w/ Nicolo)
    tunc = {
      isNormalUser = true;
      home = "/home/tunc";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2103;
      allowedHosts = [
        "xavier"
        "jamie"
        "steve"
      ];
      openssh.authorizedKeys.keys = tuncKeys;
      expires = "2026-10-30";
    };

    # Martin Lindbuechl, GR student working w/ Ilya (can be removed after October 2026)
    # Second account to get rid of annoying permission issues
    mrtn = {
      isNormalUser = true;
      home = "/home/mrtn";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2104;
      allowedHosts = [
        "irene"
        "polly"
        "xavier"
        "eliza"
      ];
      openssh.authorizedKeys.keys = martinLiKeys;
      expires = "2026-10-30";
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
      expires = "2026-10-30";
    };

    # Senad Lemes, DB chair student working w/ Dimitris (can be removed after October 2026)
    senad = {
      isNormalUser = true;
      home = "/home/senad";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2108;
      allowedHosts = [
        "jamie"
        "jack"
        "polly"
        "steve"
      ];
      openssh.authorizedKeys.keys = senadKeys;
      expires = "2026-10-30";
    };

    # Andrei Dolmatov, BSc thesis w/ Aleksandra (can be removed after Oct 2026)
    andrei = {
      isNormalUser = true;
      home = "/home/andrei";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2012;
      allowedHosts = [
        "jamie"
        "jack"
        "steve"
      ];
      openssh.authorizedKeys.keys = andreiKeys;
      expires = "2026-10-31";
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
  };

  # DANGER ZONE!
  # - Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  # - If you reactivate a user, then make sure to use the same uid as before
  # to avoid any permission issues
  # - Garbage collect deleted users manually one year after deletion to free the username again
  users.deletedUsers = [
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
    "florian"
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
  ];

}
