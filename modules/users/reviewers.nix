let
  nsdiRev1 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINU+AjLumxWb8dVrVMxwUzegWcZENOO4de886yTOHJc7 ae"
  ];
  nsdiRev3 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPpnTnb57xp2tCDZMe5oONyUxysBm7SP3/0zqRpu6Y3N aec"
  ];
  nsdiRev2 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHsNlrRA1w0oT2zL8fmd+6exWxFsvDchnZO6pECI93Yc reviewer2@nsdi2025-AEC"
  ];
  nsdiRev4 = [
    "ecdsa-sha2-nistp384 AAAAE2VjZHNhLXNoYTItbmlzdHAzODQAAAAIbmlzdHAzODQAAABhBDpbkn4baRZJNdP7LVRzYznjWipd3xN0s3378AlNkym7o8sTlukkwlXxVLiL9NApGllAFsDgE+Gd6Q13Oi/KPeARNvS0Ay9XPVR2s1GRM14HcWHtiOaIY5u5dnDUGPqcYA== nsdi-aec-reviewer"
  ];

  aranciniRev1 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/RD4fEVQ5lDFu8UDXtBx7HBTcyiUQQAW3qOSfgJZLQ asplos"
  ];
  aranciniRev2 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIAzr/1ZzUD9QPa6CF3NrtvdG4aw6NZ+qp2jnTXXuNeU asplos"
  ];

  fastRev1Key = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbZSdnpG8qR8brKRl44z4YbxeivsgAYermfGzSwscfg artifact-eval" ];

  fastRev2Key = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKDZanoq86X8H/Sa21icA73+ItU6E5pY4QfeOFd4VSti6PVKskBywDz0e30J0tGDyBHFmFqtiglz4/GscOpPN5Y6WjmVRBS85P0z7NcRRy3fHMT2DmNDFwSze+HZ656ar6CtdejQZZwyWpxCDCrHT93y2c9MCW+yuLvBfmMZjKnm8BsE4Xpx+n3tLSJUJF9xtpowYJGdAKvLTeJ+DxWAwkWgkCdEYGb7QA/rjNexHFxKYZPNZNnQ9uajsmKDGzaYeI6CL4eytuj1JyPdYlfRjhS9WpEzmQuDbjOy+hHW0I0taOSfLsZJPUfFb1LTj3djQ3aVcQC3GNZXNd4QnYPIWSRy5k8QJG1l5aF2ys4e1+59aWFrKXBCaKgnZZsNzwL9R8BZVv1PvgujCJCnnZrUJ6EwdZYw9f4o5nO3Z+r7/J+l9R+ZSEEilLVdFgY7itd3wUsCrgy77a640WlpkgT6aN+W/IImgBmNz3ynzRzb4eaxvzoP2GZciBRNiA1vBs6zk= rohan@Rohans-MacBook-Pro.local" ];

  fastRev5Key = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIOh/qHyYz/OmyrHcsKJ90W5aM+k3H7Ato3tF/HnBKln FAST26AE"];

  fastRev4Key = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZlRrs8kBa7RtMrWV59vSViGwpXpojBByyrav2/NcZONN27lMAKmeT/IphU305jOl8zCdhaU0MW+ELNmJ0IrBbum24xXTqWqhI0Ff0W9bGT3fHKCTPNKnKlfqd9JL647u7U/BcUE/oirVraGw7PxwvZcfYbvoB7kQ3jRqbT8R8cHva7/apy5+Eazl40dvY7l01kZETflaoTPX7hPEqQ/3p9HfvgC50kKs8Q/O1QHCT67fqbpszEJrdf6I3L6AM5Jnnrxv6CuHCW3icbvJAHyOejcubUqQwUiEon5wfCnim4Ebh2CfiCbrL5EVWYqkKGrl0QcyCNktaKGW8EndjfuPKoOhwpuh+xgqXy0c48VncfRh1bqYLFxLboiTISZqqdXCrdRrDSGOqTQGTLOHM9WE83+PUuXzldotzmExflCoxi9iffe0Zo1QaYEwIJ56dDfgcc0N6eMQhm/IjOOr31pRIETiAO7UTE9DWyJAUlmpUN5+4PTyqf+/WpqOab+m+ges= Deadpool@MSI"
  ];

  extraGroups = [ "wheel" "docker" "input" ];

in {
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # NSDI AE reviwer 1
    nsdiRev1 = {
      isNormalUser = true;
      home = "/home/nsdiRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4200;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev1;
    };
    # NSDI AE reviwer 2
    nsdiRev2 = {
      isNormalUser = true;
      home = "/home/nsdiRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4201;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev2;
    };
    # NSDI AE reviwer 3
    nsdiRev3 = {
      isNormalUser = true;
      home = "/home/nsdiRev3";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4202;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev3;
    };
    # NSDI AE reviewer 4
    nsdiRev4 = {
      isNormalUser = true;
      home = "/home/nsdiRev4";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4203;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev4;
    };
    # Arancini ASPLOS AE reviewer 1
    aranciniRev1 = {
      isNormalUser = true;
      home = "/scratch/aranciniRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4301;
      allowedHosts = [ "yasmin" ];
      openssh.authorizedKeys.keys = aranciniRev1;
    };
    # Arancini ASPLOS AE reviewer 2
    aranciniRev2 = {
      isNormalUser = true;
      home = "/scratch/aranciniRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4302;
      allowedHosts = [ "yasmin" ];
      openssh.authorizedKeys.keys = aranciniRev2;
    };
    fastRev1 = {
      isNormalUser = true;
      home = "/scratch/fastRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4311;
      allowedHosts = [ "irene" ];
      openssh.authorizedKeys.keys = fastRev1Key;
    };

    fastRev2 = {
      isNormalUser = true;
      home = "/scratch/fastRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4312;
      allowedHosts = [ "irene" ];
      openssh.authorizedKeys.keys = fastRev2Key;
    };

    fastRev4 = {
      isNormalUser = true;
      home = "/scratch/fastRev4";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4310;
      allowedHosts = [ "irene" ];
      openssh.authorizedKeys.keys = fastRev4Key;
    };

    fastRev5 = {
      isNormalUser = true;
      home = "/scratch/fastRev5";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4313;
      allowedHosts = [ "irene" ];
      openssh.authorizedKeys.keys = fastRev5Key;
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
    "vcxlgenRev1"
    "vcxlgenRev2"
    "vcxlgenRev3"
  ];
}
