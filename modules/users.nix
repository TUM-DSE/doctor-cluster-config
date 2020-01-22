let
  joergsKey = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7ymgN0OyRio14LNeyZg0I3frGXscYg/6Foab+BEE/uvY3iQj4//GZUd60Kp/mbBBWWoMq08Y7SV3wnkMWkhP5qtvTf44b7qNqo6lWyg8IooeqKl8TyNTwbAMxyBRDYl4Czu5IWpMdM8m1QD6G9NKAWWNf+36d4A5THfvUsYUMRpcOaTQchPbtrKdBE5z9No7jscBfmtF0VRxB/OvFImcF+PH2rWmKul99tLX9e6HunInoe1met1z18jThkeByWhSFypYL8JxXR8zLfDB1pT6/3XW062h7a/5qjUvREpMtHHlszuksZJkeU2BcHqQhbQ5BwPXTICjJuAYpeFDg+/Pqg4M0a0icDc+WmoPpsSU7Xx5O5CRvkH66R/lxYh95eF1wEU4K0/Z4m4V3X6BattV0zgu691it4ZidVEBdNtgdFu29pEExaKDcUF689MujE1PREpl/yOx+KiKD7iFJgWKhg2i47oz0s7BNbMwcU7nJJvoBLlePqLWkMsuF+MwwUEolTd21uqWsYzcqB9AkT9xBp11wgWB8+FAi9vWzg5O/A7FXdQ3eV7ZLgJH1MxR4DxtKErBCHzBzs6U+OpiXScp2AYD3OPgffCM2DtiJbcLMQqktNTsTsiw+EgOdwffufmenXcSU6d74KNlu12hsFU8LHyKb9edhHPvFEkdnCuZYyw== joerg@turingmachine
  '';

  mauriceKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH756wA1zmO+FWP1/WJTwezIxBmDQp5ocS5kyA8jqLRv
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6WLnXEyW0Q2xvuvlBwp27LPljmmR0goCxKLhUHK9ljlYKwj4Nrij7ps0AgxDbWWrkeJVTVuD2e/R7dRnYlH2BpUmYJwOP3PKCkpVJ+XWTYKpkHUyHJNwhPPwGIsxiuOSdyrsv5YwbpwFTf8+BllZwThX/zMNLqtMz6FzYiWkLncQBE3ZB/6uQypLHfPb1Y57nmmsV+FzztrorgWDrG5lVp0x3kqCx2l2sPflhLJiW/3TuRRlLZecmE0pP1gv20j+NTfXiYivx4Cq1rdgkYFBAE7BG0j1PY49oZE9FF0pyWd+Fgrzrz2DG7HECPL37EO+M8nw10zBnD6GXniH0DsiMivz6mNZCm0CZ5TZQAJebx2hXXzFQYE7RL0O4+k4CA2RCvpctBpcBHS7RLSoCGpF9IkYUCRGsyy7YKTcXA94XKkNBr+zbT6emCnUG+0hyubgNHW2jEEXRhRKGkrBDeq1rXx+T7xr1QyLAbEDYFsFFq8tS8P3wE5q1Oy8drPZjEME= maurice@rose
  '';

  dimitraKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUXap/inau3PgwfwwzA/xgjPFwMIDNlNlQ6FDPxUS1bFxvLUewLlP7tHEjlU4aCe5/KPqtbnEOuU3ZBRBPiGAXA1WxIofQH4GLD9kUoxQXk3n9budu7Ni0Mc7fk4B4yKA6hAxdy78FDbWyJe7UMYhFvDJs9+A7HnxishLKrea3LjDVxW/2dhpIDOj7jKDJKh56m8WQn7Msb1w02f7o0J46EA49y1hlJFuGjLHSYwx5O7flFh2tyKiARDuriqp64rSLONWXmOWDX8d+JcnIZJGrMXxTWIuuqxkdsw0tvi7g/msDQrn8DVGX2sRxoGYksKMrMhYAAAoLiwH0Zi2777DZ demy@ubuntu
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDkFay+8y99fYWHXCn3JJG+iuA9UN4oEdUD2l4C5oyE+j9gIpc1m4TzNYOmBHmvZRKKwhrHKr8ORHdtm26+iQCkV2j5/AuununfsuXr/pL+Zmm+muKgVPdtturCEEa5uzfEiuFHa2BiwW4FarBu1pC/Oc35R8NOByDAPe190iOS4kf1JhlhbOjUHjf7b823FwDfqAteNVINyNoIBWG/yJBv9Xzlr62G2DNkUo9VLreANCgTwuLwP1q3gxavlUNIDsZYJ+k1TdjB0OK1T7MgCvz4gUIjLadYgnMi9qGeq5eiJxmcK1VUDenlY1rzKpTbt3pZwgFO9OX4OxGWczCSbKImi0UdpbsMoVnIHm6xe2Y+c54/AgeVztsWeD4L9PArrdjBaXkcy/ALs+xNhQEJgPZifU6PkL9c1PP++n7IozLZSTHex2WdXAqxsXTeEuE7ldpzAQL5Hnj3qsaIcdrccd9iWslfSBnWxFjqE3+bPe71I+1c1sdI0hP7OGQng+8ReKS6hL7LkzsJlDfI6k/WUg299K4Xq/ljqE7rT9K6/qxe8E2bBvo18DhgZ0WhPuwsDpGyZm9DwnYDN8Xuv5QutzPYyuGmm65YNjJ9I7Dhq4npKXVtZGZI/46KsvDqr6StLKyCNZywxdMFW3FN01+QWtRWNPCBJlYTE3r1pveEkM26Q== demy@ubuntu
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAZ8RRWQz/Sy8L+H6eUQJOROlV733U/Ir32SaQP+rLrQGfkqE3oguRDtHfj6NEA98q7eaQDx9v57EUpHe9rTDDF/JSjoOsbWEF90M7mMTqBjFAb742pB/CVOplyhnniZh22vruu+GC6hBjd4cg9Qw6IPueZLB4f1nkXSCboW0YY3I4Gaq9DFlk2Gi8G1VQv1tYa5+6i9eOEW/+h2VUQkHtCbNYFnt/5wlsTkP6Gh6MeBRkrUQMOgNmYfJhPtE0ZLTkrTs7BZCW5i5CE68kXyYWh2WHLKM1Z3vw1SA2MuEpQPdoKRwpiQf+ZoWeciVd9+1RXcS7PAWcOJg854I9RyRhDlErAS1ENmO3ivqEYo2FNd+Sin+/uvG0c8IJONJMZyWOnaLb+dLfV0/0EdAo1htFLFefp83DtK9r1QcYoFgAL7kwYk9Ox4R9CDt3y/UueMbmWC3W+jSyUm03LZJkJa0tXkKE0cZYcajoH2cdSWjZdUbhr00jBjzJoovGb1tKw2k= dimitra@rose
  '';

  dimitriosKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8PDKvdmcJIyd5C7XfCEKXQdbVv8f1sy3+/jl0EEyQA17xVU00lR9my36QLk9R6YKRo1EF2CHf9jNrQ6q3+cZJJEX4uv0gdicYiISy9+aPBAOEiQ6bfatxQmYMXOwv3Hv7EP5rEmPPCwFR8neLQEAvXjY/yucIeyAPqKFNU73OH8rqR++AmUQGAi7LGCVTYYQQ+uTBHR5H7YcvyzElDgGBWgxWJRzU+hm410BjItHYtP51dQejqKLGWCqp6r3slgWdZ9Lg/tytv5fzl19JiOV61TQ83hmgtsdXn7pgzp9OFAOXClYm0P6DwMdO/bRDp003zzO6/jS1Hphi4gvYxnrXlEFebzqLG6AMhoR6BUgPSUmQQZFedxxQC6WAGrSt2loZp739Tf1vJtF4Ep+WRb/DITss1VRYYxjPExgETM7BGqVICEdrqkM+aERxUbkfy2HbFdzP1J4P3wXGFuKtBUuEyvmT4eE4D+Zlfh7lhGw3IXkNj+YEeLigGnqVACvCUqa3HyLNwXB/4m4GRN5/noEi5I8VKgTxdrycRdSsBd4gNIOf0QjtVAD6CGkmWQURh28GD4Plyaz+H8BAsaWuH3aX4wIyV6+6rfPyO5T5rgIMxJkYoD6lWupwY1qO36KSC7A4sS0HcAPR16EZghMcMC4FNy4PGLIlUuwJ7KJd0Ptlyw== dimitrios.stavrakakis@hotmail.com
  '';

  # Lorenzo
  s1443541Keys = ''
   ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMGYuFUPoNlV6I5H5dxqiGjp39w+8Yrj96NjEicr7Fgl4OTIvCw2++MscyLsVsLnT0CQv9AKMiKNzRPJ/GYOMwgMIDZ9Sfa0T6jPjHghjCHB7UPt7X6NZCEyqoh2R1TpfkJ4hewvH8DWGQcvtDLd37URFIQzFet8Km6unLJPbWbcdoAd1HQZd8Ww5a4YQR2Ek+ZjIp1cm4w/YtZaiLqsSgDFedglZVGCvhG0xQs+esN2HdvvlhkcArDw74/LeJo9HkvK+QJSMqrXHd+1BHk/gtxmE2A5t7uYsyfH73QZffh0eVtiZbDG9hwEE9mmnFD83do7delEdAUGJR/n1EJ+6z
   ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8d4N+83o7l4OHu9awJkrPN27Rbhzx7WmmhmRs8q9UpAuoj9HgoA57JWlIz/EyyQYxjkK7su7emX5Thprg8AwKvI90rFPM2xO7GSuzAWx44++JhlQ7VgHAy9NIiBhLjg04AuK8pNKEWDu8D/sY7GGVMbcDJnOC+pxbX37qZb/I6liAKYfs8BwWasCgXf3JwdM7pj5ijYbfdxy3H2qU5STJkLEBQZF7vTOCLrKvbVswYKFh3DZJbKvqGVIqnmhhvkOUEr5No9YQtgJm5hM7ZJEnCtNeQbKyzIhcW2qOK5yilJrqHcVFI+o6dqL/V1QZB3um6EpEoOfY1483hR9HD+/remCHHxFwiDpptzSuPdW5Hpoe3J4aSHI7znJKI8IW/ugK7o+Xy4Wau4SdUu40kJsnHWEiOUL9M9ZJ7b7XTrAT9qv2KmMl17Sw1qZSYp5SFdVkfUnTCdZF1Zf8leT6WW0LTIuyUESfxfDB3OKlBmAJFNg4L42SjtJLrwuXCgugnhKVp/xNbA+0YHS0Lgy8TJbXkgd/xVekFdhwC7w9Iqszi4KTmGQilPLA2XJfndUedPphDD1Xq1dFWRG9fnKImzmW7JpCvAUHFUrdAqCcJ0Eg4RNkfK4aYFGYk54d/yI6beJPvshjhNf1UqWJqbUdy+jn0E5N53BNnTWFj3Rk/O2uXw==
   ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM1VKEyjAXXdwAy/aMMYKf2F5HQ1888BwA+tVW5KvfqA
   ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUqTN9nkNiZniNOzLPkLSwkmmxz7t6xmzBdr0UQm5cBmFzu5BXT2OAfAiaEzN9piygn1MEXCREjYDOvAYtoU9V70z0+QnwB0A2XlCkedHq/8HIxwTWLP+GWR3adNXaDkbh/++zdhOrJdzfaGvM1Fm/0Inzux1OJykWMxDOiNZ5Q3eNrN5bYolVYyTUwFZnbHDuB8dzxH38GM8fLrPDaNlPlR1E0JvAQ1oSpwMTa8LgZl3r40+INHr6en/rM4K7p9eYNSQEtrNbPyPEa+Gw9xeAMopOpRTUBgUwQTzM8pux6lypyUqaxzDC4ZZXRQlMEFvjHYaBMRSVoK/wD+F7xarJ2ZmOu0NBEKh+XJDitQqbm5HpwskhUBvplqgF7BBbJbxW3jDL+0SrOZKyAQHSvRWgYiMrAk4cJ1hZi6bgTgBxLdTSMf+LSqNKi5xv0oiyTGG5gfuBy8OiQXhNaf36xuzNW/fgPLmoB+Kp8h+PV70R8CP0hhwWCgdWtBacpxIqVrc= s1443541@rose
  '';
in {
  users.extraUsers = {
    joerg = {
      isNormalUser = true;
      home = "/home/joerg";
      extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" ];
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1000;
      openssh.authorizedKeys.keys = [ joergsKey ];
    };
    dimitra = {
      isNormalUser = true;
      home = "/home/dimitra";
      extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" ];
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1001;
      openssh.authorizedKeys.keys = [ dimitraKeys ];
    };
    maurice = {
      isNormalUser = true;
      home = "/home/maurice";
      extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" ];
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1002;
      openssh.authorizedKeys.keys = [ mauriceKeys ];
    };

    s1443541 = {
      isNormalUser = true;
      home = "/home/s1443541";
      extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" ];
      shell = "/run/current-system/sw/bin/bash";
      uid = 1003;
      openssh.authorizedKeys.keys = [ s1443541Keys ];
    };

    dimitriosKeys = {
      isNormalUser = true;
      home = "/home/dimitrios";
      extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" ];
      shell = "/run/current-system/sw/bin/bash";
      uid = 1003;
      openssh.authorizedKeys.keys = [ dimitriosKeys ];
    };

    root.openssh.authorizedKeys.keys = [ joergsKey mauriceKeys dimitraKeys s1443541Keys dimitriosKeys ];
  };

  nix.trustedUsers = [ "joerg" ];

  boot.initrd.network.ssh.authorizedKeys = [ joergsKey ];

  security.sudo.wheelNeedsPassword = false;
  programs.zsh.enable = true;
}
