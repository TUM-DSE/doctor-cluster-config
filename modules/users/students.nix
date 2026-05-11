{ ... }:
let
  gierensKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBevyJ5i0237DNoS29F9aii2AJwrSxXNz3hP61hWXfRl sandro@reaper.gierens.de"
  ];

  sandraKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGNAM728FNAtQhvAih1kirZszXRISD4wI+yxoifgRH1C sandras@tum.de"
  ];

  antonKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8AlSd4iLm1XLO9p+xa5xLKHYfORl32wD2rOjSYei9d anton.ge@tum.de"
  ];

  steveKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFDiE8OWLvbkG6oW/iaRCEG6p5ag2fp0gYKdFp1c+B/9 stevebambou@steve-7510"
  ];

  maxKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHO3xtv+H2/Tjad7iNhVkjEjqjmmCgeqRjwmFVorHVRj max@r"
  ];

  christianKKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfke0RoVMEtj0XjxdjatQgz0RQxs7gaGSgM2OoGBemO chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL7ghrJVl24UkfnyNOz21jbmrnPImp3+UR4/p2xymbnl chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDwlqdl/70dJ1ABKwLEdLB6/RDpfE4RVaB+xL3YJ1v3+ chris@kingpin"
  ];

  jannikKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcGR16x/38pzE7bidJu8Ow778pogCqN2U9h5Y6LZ8Xj jannik@jannik-ThinkPad-E15-Gen-2"
  ];

  yongjieKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJDkLa3VpTxlK4o49Pf+tGp4sIpKxNwDlqqFoDKxVnfX 87616@Huang"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLl0MWJcsj7qlJDtO47j2gkIE1Ftjy++dk6GlV6cJZ/ yongjiehuang907@gmail.com"
  ];

  florianDKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzBXMrJs0r2uxG+LvG3gRf5hvMWlnW7x1A2klk+AfcyqTSWvVty51QaIcx9ioeJrS35Ohl9BCvwgKchCWHrHGMKCCgy5ghKZoRVPLeAa6R4lTK25p0rOu/3DkY0wm97/IVWP9GKhT0Ifyix6o9HNutHsP7s5TTVwr2ys4v1LtOareZDTtTOE44mvD9ECisVNSIcXHlnYQO8SAQ7HLJ/fZio577BXvgPVHq6OgVzypXeIYUEW1EAN/1c6pgUhIhZ0Nh38p2Owo1C84UyIdKZ6z5gS2xfi/9mXoxd71lZe68+LjKJvatfXdLI0tCNXO/aSZoIOg6l5+OYfnZPF8nqqmd D073556@WDFN34367251A"
  ];

  johannaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIUFhOLikx/MHcvyj0lqcKvfzG7Hj5HFmAtIX2FuQZbksWD3wR8TCv+tTi62j34ez2KuS8I2CxaEs8RLgR2ScBL2N5YjzbLjGeLapjPyY5EMJHlIp3XGq4/TWBPsdgKu5FjWa6CcsX4i8uCXeOVIut6IsT/9RUtSsOH98XWSh73naHGVzspNMInyZxR/uBM5cZXQl4k4wGT8XL1UFypPspWj/ScoYC1U8nRj3+sArXW3RzYtX1NI5jQF94DZbBod518rzXOPATuDoLJcrarQjpd9px6uNIiFkg7u9qs3ws41Fw2Wy/atDerE/xvSLidAjLHeIfGoK+MXkYA9GK8A5RKDqHv9erest76kkHg1xH7fiDVIRS22Qjcj+6h69k8wwKsJtwUx7J0hDtGFpBuRJyQnN4OdzAbnpiRK43KUdAN8R4gbYO6+ooCOuAKjjV/ZZIeZyE/jg9MOy1oIRFbVb/JXWaRkGylphASgsqslBP2kh6mHz9PQu9Qs7aSmQnRjx6dJ99tbSvCWVoqfMhgAccFYELGA6iU8rPDDygqL/GaWX+mu7h2kB/M1jFLb9XcEVgSaV0HT2zkKBczncEFyAe2jg/MjR2qhbKMnSDJMfbAdMNPfGzqybkIGw8iwyIXz7tAje4o7hGl8i2PDb/xFH/jEaLY83JDzZPShVeepLRIw== johan@DESKTOP-BE42OA9"
  ];

  chrisKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVrVgCf+jRXaQp5HYTzOie73lhgprzoJg9CvaDRdI0gHCNaKSQkq7wVMcht0kxnA/OcHekDdZsVBRu0VObRr8+8EQFtWeEvvevQ3TLQurz7ZcKvemX2vu6HM1UmWxdvWpPUVPHyjvJzXBYzy1+7NTK71U5uEULbSb06gpJ03bYZkW5VvX9Jew39tKiqUfYDW8moQ6obl93iU8GXETDuSx1YyQlq5sZ3cPryo5AlXjIJI8VFMHMiAHPenr0H/pkArBH0Gt5DeFEylxQVTlZHapR7zxk54pMoVVjXnbFHuGWkV4xSEaItF4FEh93xuydv/5m0JpIYdqWAjHvQZIb2aidhQ0gn7h9WlxT9HHdjfjiRgMfo0MiC3EdVIVDZriX2SOpNyLB5prWpAvXrG8MevlXSUd1vzGShR954jQ8WDjqw5K4X3GzdABn9WsRvkss0bX0+LS4XdpBY8nhWwgYTGYOjn1mGOqGmGeFRBx0bGchSy+fe6ImNR8M0pHH95aYoqPG9SZpoOipN1pseN4r6glA3C9RNQUuXeiyIpa789/Ssp9KPEqq4UlZVJL4SExpSnysZsadv9nwghQlVodZvYZohM5bbDj2E8lgYsBryWvYFWI84AliQxkVlZBL0uhNMa5GxQ/MjiGoE17uOnPTSFiOkpywh62PbtLuiMt1hIScoQ=="
  ];

  raduKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8+2IgrKrbXjVW5B2ApnA/O58t0/Dt5teYOO+LYI++3 rr@fedora"
  ];

  leonKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICgeUnSJhExrcfINl80baYvn0j9RXTq2QnZhJ3gN1J7V leon@Laptop-Leon"
  ];

  jakobKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkhv0C1W+x0+M03Huai+BRO9MmW9E+EnCfPXZmRF+Yg jakoblison@MBP-von-Jakob.fritz.box"
  ];

  hernanKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMowVBAs878BvU469/2lPFGrUYHv6t68w6p1m9BKPTG6 hernanl.leon@huawei.com"
  ];

  martinLiKeys = [
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBABCmZLhiHvPWTbyaInI0XBqpbHi5OUdymVr42r2ganFA/7eGfsTi4BN5heBmPkHlay5g/Pl1I0YYJsEF1tdIffqtAGn8riy6BK8cJ76ABl8ZSPQdoVlOuncXzn32BrjJ2kr9BAfCV21WeC2SfpCRYj3sCWZFA2PknSoEfh0kzOTEW22Vg== mrtn@nix-nb"
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBACZkmXdEDbg/5gtbANAYQfSaFKEluiGuQpa6MCA+msQIx2lr/1M7+Lmcf3sWG3kYyYJZFZ+6+sUmUFqgeJWN6jOogGSfK/OEyY/zKdrIqcSIsvoHREhG/10VXSbGWv+MS9FjxuT4AO40FLRF5pq8cGQgUcm3khAknF4yQ6TtJQyxU4OOw== mrtn@cronus"
  ];

  samuelKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID7Km5wzDVt/kzQhfz3tJX+na9xbgnTbmhfXw2eiFP3o sammy@artix-x200"
  ];

  mauriceKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2BTsVv0YJ48wrV0s9SL4rGJPjaj/vTGMRUExAH9Sj4 db-gitlab"
  ];

  simonwKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwQd4nCBkaiCSXrwNdWbvQdK+MUAMA+t3X/GuRBtoGE simon.weckler@tum.de"
  ];

  denizKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEhDutzyQHLW+UqWpQ84A+q6bY2KUrLFgLjPlKOWzL3 denizmersinlioglu2005@gmail.com"
  ];

  tuncKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+deOcBdufU6Ug+T9DflHrBeQ9cBo6Yl/YjQ+22CaLsd8ZF60nAUQddwu5VXGs5gcK2IUtL9UUpuWgMhSrQHJ5K5Bh1fYQsLFmiH5TFfQAQhO9UIwlJTy8+H89R07Lbro0wWe3/eVf0sAqtlkmcnjZuGg43eJ3sMFtjcwU9w+KZs1lQhC4v/D0W264ZOs+I8FhWCWab7aZMWm7UTxJmc6aq4mcOzqNnMBQarQmjIvVIO3kfsUtyj9ZmfW5hLsF0miB1Gol+W6ZpoK44UorMJN5tUNdoT8jz4Cze4Ohe+rXDgoygvIX7uw6R9eJ4mi9zrl0itEnLHhdPs4CnltrIyAMFauotbp8S1PhUnLTGot2kjJ/0QmG+KkSDKHa8UuMqE76kpxhZ+EbqI03dpFCyl2/7VKiybNwfPyRX7P0ZwFEpoCJt5ckYPnLViNka9HvTg9rk22ofVXshNcX76BpVankSdm18rNzXj3B8Ggd3ue3+lnVzsB9Zz0hKc3njq5j1hU= batu6@Batu"
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
    # Sandro Gierens, MSc student working w/ Masa (thesis finished in Dec 2025, continuing to work on the project for a few months)
    gierens = {
      isNormalUser = true;
      home = "/home/gierens";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2003;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = gierensKeys;
      expires = "2026-04-30";
    };

    # Anton Ge, BSc thesis on uintr deleted after SS25
    anton = {
      isNormalUser = true;
      home = "/home/anton";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2067;
      allowedHosts = [
        "xavier"
        "ian"
        "irene"
      ];
      openssh.authorizedKeys.keys = antonKeys;
      expires = "2026-03-31"; # WS26 ends
    };

    # Steve Bambou, BSc thesis with David (Branch prediction research on gem5)
    steve = {
      isNormalUser = true;
      home = "/home/steve";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2070;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = steveKeys;
      expires = "2026-12-31";
    };

    # Maximilian Jäcklein, MSc student with Harsha (Resource disaggregation)
    max = {
      isNormalUser = true;
      home = "/home/max";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2071;
      allowedHosts = [
        "amy"
        "clara"
        "rose"
        "wilfred"
        "vislor"
        "graham"
      ];
      openssh.authorizedKeys.keys = maxKeys;
      expires = "2027-12-31";
    };

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

    # Yongjie Huang, Remote student working with David (Branch prediction research on gem5)
    yongjie = {
      isNormalUser = true;
      home = "/home/yongjie";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2084;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
        "jack"
        "rose"
        "polly"
        "steve"
      ];
      openssh.authorizedKeys.keys = yongjieKeys;
      expires = "2026-06-30";
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

    # Johanna Latzel, MSc theis with Patrick (ARM CCA and Unikernels)
    johanna = {
      isNormalUser = true;
      home = "/home/johanna";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2087;
      allowedHosts = [
        "ian"
        "yasmin"
        "jamie"
        "vislor"
      ];
      openssh.authorizedKeys.keys = johannaKeys;
      expires = "2027-12-31";
    };

    # Chris Deininger (Bsc thesis with Felix)
    chris = {
      isNormalUser = true;
      home = "/home/chris";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2092;
      allowedHosts = [
        "jack"
      ];
      openssh.authorizedKeys.keys = chrisKeys;
      expires = "2026-12-31";
    };

    # Radu Raceala (BSc thesis with Anatole/Peter)
    radu = {
      isNormalUser = true;
      home = "/home/radu";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2093;
      allowedHosts = [
        "wilfred"
        "river"
      ];
      openssh.authorizedKeys.keys = raduKeys;
      expires = "2026-10-31";
    };

    # Leon Simoniants (BSc thesis with Anatole/Peter)
    leon = {
      isNormalUser = true;
      home = "/home/leon";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2094;
      allowedHosts = [
        "wilfred"
        "river"
      ];
      openssh.authorizedKeys.keys = leonKeys;
      expires = "2026-10-31";
    };

    # Jakob Lison (BSc thesis with David)
    jakob = {
      isNormalUser = true;
      home = "/home/jakob";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2095;
      allowedHosts = [
        "ian"
        "jamie"
        "xavier"
        "jack"
      ];
      openssh.authorizedKeys.keys = jakobKeys;
      expires = "2026-12-31";
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
      expires = "2026-06-30";
    };

    # Sandra Stankovic, MSc student working w/ Manos (thesis to finish in Sept 2026)
    sandra = {
      isNormalUser = true;
      home = "/home/sandra";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2097;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = sandraKeys;
      expires = "2026-10-30";
    };

    # Martin Lindbuechl, GR student working w/ Ilya (can be removed after October 2026)
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
      ];
      openssh.authorizedKeys.keys = martinLiKeys;
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
      ];
      openssh.authorizedKeys.keys = martinLiKeys;
      expires = "2026-10-30";
    };

    # Samuel Khuon, BSc student working w/ Ilya (can be removed after October 2026)
    samuel = {
      isNormalUser = true;
      home = "/home/samuel";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2099;
      allowedHosts = [
        "irene"
        "polly"
        "xavier"
      ];
      openssh.authorizedKeys.keys = samuelKeys;
      expires = "2026-10-30";
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

    # Simon Weckler (BSc Thesis w/ Teofil Bodea)
    simonw = {
      isNormalUser = true;
      home = "/home/simonw";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2101;
      allowedHosts = [
        "jamie"
        "jack"
        "polly"
        "ian"
        "steve"
      ];
      openssh.authorizedKeys.keys = simonwKeys;
      expires = "2026-10-30";
    };

    # Deniz Mersinlioğlu (B.Sc. thesis w/ Martin)
    deniz = {
      isNormalUser = true;
      home = "/home/deniz";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2102;
      allowedHosts = [
        "graham"
        "eliza"
      ];
      openssh.authorizedKeys.keys = denizKeys;
      expires = "2026-09-30";
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
  };

  # DANGER ZONE!
  # - Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  # - If you reactivate a user, then make sure to use the same uid as before
  # to avoid any permission issues
  users.deletedUsers = [
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
  ];
}
