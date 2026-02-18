{ ... }:
let
  gierensKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBevyJ5i0237DNoS29F9aii2AJwrSxXNz3hP61hWXfRl sandro@reaper.gierens.de"
  ];

  simonkKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDrdEe2/aOcUzaPtkDLJQ8VrcfiF8tNpk02SPLIVrsTywSHrBueOMz/cVR/Dkk7HREkI8iPshIefYogGgXNrwXp4ogu7DFA/5FS58QgrUS/il/LYT1pIcC4URFt0s5UHxvXbVP/zPVVpDZ7AqXLzz0H95csR9mO5eY2CgZh5+haC1dNhBEZK7v2pcsp+TrDzcxKjo5ZjqFAUNRBAT/lMJy2t0Zdm9cnkNFYymC2n57mgve2W9L8mRsMTYdQbwT7S7PgV3605e7bphnvGVl09iSkwkbQZ9oiqvZFdVn9id6tPxlf6wnnMo2YU9fuqRJoF6kKGN5Mvqvmm6bIUW5y9cFjpAniJg7lPY2Dc/em/q5jpdYirnkPnjnjpqdNBKnroRbsNL8bUWPyyZM4seSAIaw61OUQLhJHClUx9sAb3nyWRq6k2PAB1HcBeY9dVgv3b+0ZzNsR52IqEzs3VOZGAS174Kd8FFk7oyV15a1qfyhCzKxNJIbW8AHXh+S7EcVnyYyJguJ/hblUOwsc4Un/3UQkmhTTOkZOb3zZklHM62isA4yA6uAUkCxASgaG0UMtvzeJiynYLr1x4YR2jTKU2VD79n8pcKienJmBH0d80FtnPMiJPZA4EiVSXYAZ1PKbVsSBk47Ia7SmgZr46VX4ha5frAY/kQNzFk9qyImuyPyIyw== kammerme ge35tem"
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

  peterKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGEQXgzXZD88m4eXmr1R1mWTVhtknjHrhRzJfWa4d9xU wegii@idontcare"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1heCt0ca+MMrSbLPtZBKp67u9QslGURHhYu3VOvxxIzIjzH44yTBHdXXC6slhr8XbTrDEDJfg1fCXFgtGF/DmZXlgP5mIOfGI7lfN/ZoRXaBYewOGiTnvJ8in7efZ0B4eIu0FfVtvlWsfWhqCnv3S4XfW30gOkzaioq1UQMDfZqNoBjT/kXck9CGppK8hN6SRk3BS5JbEk0FxEyfo3UKDWucfqTvlMnvziGrN3sQuxAZ8Ou0YsNccK7HxbcYVjCAMCU4C0ZNNvUNFmo5rumVzo19Ga2bO4TEcNi4Qdi8/eg3S7CJ2OW0xWgaCRLgKQiagD2FgWDiUS0icDST5Vm472tHEmtoxpLHOYYdXJW/9o/6WfK7t5WKMWwR945V3tNBQMyeUbuxC4s0CJLgxybYX5FiAgfmCKMEU62zKQtddY5WUIU2uuCnn3kq8dD9YSQ+O/o/ui+S3zjInKqDyIVhyaOeGKeHN2CaJMrdeXeKn3B6IBiN026XqhkZFKuF9B00= q673178@LPTP2044167"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLB9H6gajDsEPi40M4VTDbLZAZzLOJYp/pffDrbhcrN peter.wegmann@yahoo.de"
  ];

  neelKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWozsDBs44KjRUHgFuipUeh/CAbiYnjpqHI9COuYpAv neelm@Neels-PC"
  ];

  neelmKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWozsDBs44KjRUHgFuipUeh/CAbiYnjpqHI9COuYpAv neelm@Neels-PC"
  ];

  yongjieKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJDkLa3VpTxlK4o49Pf+tGp4sIpKxNwDlqqFoDKxVnfX 87616@Huang"
  ];

  florianDKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzBXMrJs0r2uxG+LvG3gRf5hvMWlnW7x1A2klk+AfcyqTSWvVty51QaIcx9ioeJrS35Ohl9BCvwgKchCWHrHGMKCCgy5ghKZoRVPLeAa6R4lTK25p0rOu/3DkY0wm97/IVWP9GKhT0Ifyix6o9HNutHsP7s5TTVwr2ys4v1LtOareZDTtTOE44mvD9ECisVNSIcXHlnYQO8SAQ7HLJ/fZio577BXvgPVHq6OgVzypXeIYUEW1EAN/1c6pgUhIhZ0Nh38p2Owo1C84UyIdKZ6z5gS2xfi/9mXoxd71lZe68+LjKJvatfXdLI0tCNXO/aSZoIOg6l5+OYfnZPF8nqqmd D073556@WDFN34367251A"
  ];

  robertBKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqssRMR/zxTF+DbjNPzQhXUOtn/ClpBSFs8pBbs/4g5 atlas@evilatmc"
  ];

  johannaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIUFhOLikx/MHcvyj0lqcKvfzG7Hj5HFmAtIX2FuQZbksWD3wR8TCv+tTi62j34ez2KuS8I2CxaEs8RLgR2ScBL2N5YjzbLjGeLapjPyY5EMJHlIp3XGq4/TWBPsdgKu5FjWa6CcsX4i8uCXeOVIut6IsT/9RUtSsOH98XWSh73naHGVzspNMInyZxR/uBM5cZXQl4k4wGT8XL1UFypPspWj/ScoYC1U8nRj3+sArXW3RzYtX1NI5jQF94DZbBod518rzXOPATuDoLJcrarQjpd9px6uNIiFkg7u9qs3ws41Fw2Wy/atDerE/xvSLidAjLHeIfGoK+MXkYA9GK8A5RKDqHv9erest76kkHg1xH7fiDVIRS22Qjcj+6h69k8wwKsJtwUx7J0hDtGFpBuRJyQnN4OdzAbnpiRK43KUdAN8R4gbYO6+ooCOuAKjjV/ZZIeZyE/jg9MOy1oIRFbVb/JXWaRkGylphASgsqslBP2kh6mHz9PQu9Qs7aSmQnRjx6dJ99tbSvCWVoqfMhgAccFYELGA6iU8rPDDygqL/GaWX+mu7h2kB/M1jFLb9XcEVgSaV0HT2zkKBczncEFyAe2jg/MjR2qhbKMnSDJMfbAdMNPfGzqybkIGw8iwyIXz7tAje4o7hGl8i2PDb/xFH/jEaLY83JDzZPShVeepLRIw== johan@DESKTOP-BE42OA9"
  ];

  iljagKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG0E69xnjVWlZRp7SUmpwgzptEd+X06X1vgiEQMwmhlc ilja.gamza@tum.de"
  ];

  benedikt2Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpxUXv21ooYcFRbcQttAwYIxd1ZPPQmraU6FqykzOJC benedikt@Benedicit.local"
  ];

  micha2Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA4ZPVfaFknNxutVPka/vdWI8XeXnBGHu37YmUrsleEg micha@Michi-Lenovo"
  ];

  yvesKeys = [
     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB8Z0mgIBVsM3DdXMBfnxbThcUF0GCm7saPMezjXZMRl yves@rudy.local"
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

    # Simon Kammermeier, MSc student (expecting to finish by the WS2526
    simonk = {
      isNormalUser = true;
      home = "/home/simonk";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2017;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = simonkKeys;
      expires = "2026-03-31";
    };

    # Robert Barinov, B.Sc. thesis w/ Anders (Tiramisù)
    robertB = {
      isNormalUser = true;
      home = "/home/robertB";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2061;
      allowedHosts = [
        "graham"
        "eliza"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = robertBKeys;
      xrdpAccess = true;
      expires = "2026-03-31";
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

    # Peter Wegmann, MSc thesis with Aleksandra and Manos
    peter = {
      isNormalUser = true;
      home = "/home/peter";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2081;
      allowedHosts = [
        "jamie"
        "graham"
      ];
      openssh.authorizedKeys.keys = peterKeys;
      xrdpAccess = false;
      expires = "2026-04-30";
    };

    # Neel Mandal, BSc thesis with David (Branch prediction research on gem5)
    neel = {
      isNormalUser = true;
      home = "/home/neel";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2083;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = neelKeys;
      expires = "2026-12-31";
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

    # Neel Mandal, BSc thesis with David (Branch prediction research on gem5) (recreate user due to UID conficts with syslab)
    neelm = {
      isNormalUser = true;
      home = "/home/neelm";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2086;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = neelmKeys;
      expires = "2026-12-31";
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

    # Ilja Gamza, SysLab student with Dennis
    iljag = {
      isNormalUser = true;
      home = "/home/iljag";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2088;
      allowedHosts = [
        "graham"
      ];
      openssh.authorizedKeys.keys = iljagKeys;
      expires = "2026-12-31";
    };

    # Benedikt (Sys-lab)
    benedikt2 = {
      isNormalUser = true;
      home = "/home/benedikt2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2089;
      allowedHosts = [
        "ian"
        "yasmin"
        "jamie"
      ];
      openssh.authorizedKeys.keys = benedikt2Keys;
      expires = "2026-12-31";
    };

    # Micha (Sys-lab)
    micha2 = {
      isNormalUser = true;
      home = "/home/micha2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2090;
      allowedHosts = [
        "ian"
        "yasmin"
        "jamie"
      ];
      openssh.authorizedKeys.keys = micha2Keys;
      expires = "2026-12-31";
    };

    # Yves (Sys-lab)
    yves = {
      isNormalUser = true;
      home = "/home/yves";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2091;
      allowedHosts = [
        "ian"
        "jamie"
        "xavier"
      ];
      openssh.authorizedKeys.keys = yvesKeys;
      expires = "2026-06-31";
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
  ];
}
