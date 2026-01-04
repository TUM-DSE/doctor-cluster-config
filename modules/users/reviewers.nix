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
  vcxlgenRev1 = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ+H61SEboXJvsB07Hyj002kos3ANkxAIErBTysqbWdsXp3uxbqt8x2k9jxmXsEj29atsbmY/97m6R15SpnXeTNetehI2hq6DGlDY9LJQovyWAVna8OKaH2Zq1Iwn562HVVQP3dlbwAFHaleWjpT7YU7va15tOxSSzaBYWeZK0iMV9AaHol9516fuaueEjYU2DKaF7/4r8ACtrNzi9b/BNHnXg+xJf4eyosTgjfgU8r+K9fxCXp4pswilvWuGFNU4Xl2MjSNkqURcUOMcS+CosKzH+Dd4PBG+TQD7iwU/ImA+WcS/J+PrZNApGiPyQpE6t9A8anke8eih6831m5O1N vcxlgen-ae1"
  ];
  vcxlgenRev2 = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyhLfOc5KlnzXXEU0qMr1G1iUVEX66nHByQLZfE89iuOJFm+QemesVeDen6T5bK8wPRuLFisjWEQZNGU+LqKoxsmaaKRtRAQyswL71ZYx4u/UgXsR7h4DhT0KMVtOS3pdJRMX5ZPW8jo4qDR+h9S2CmEOG8bzEyCeqMgVo0boybVN+99aR8pCirBAhXjmVjbHzIkV6m3bvJ7R03Ar/5g3KAN26/bG/BLoyi/MAYL8WioLuew3zKhrmP+njK+7qx7EcHgqPsp6ph0TrcXfFiwuoYzdmdNzinRrqwDTN4gEOWluIuIxFLZxI80tLWlaAQEOtj/03tBYR2lXuIwiVd7P/ vcxlgen-ae2"
  ];
  vcxlgenRev3 = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgzscgO1YgCQJla9K/RsvAOtWujALbBSnSXp40HeW50zr5+CuPVbSN6Oh/ZzyXm8vtDjme6nzklNC2MgwI/db4PaMdy17SykjW92pAvDg9zFw8yP5iXQPhQEGtLfUoVjl1uXJlZhDSPC1YrBgCHbZCUl3lmL8zZ7B5LEQY4ZihV9tzCb4wC/+jt8J1gs7k4c7TFp7tOzlpZ7u5a2ZAH8i0ijgaVRUsyaGEGe8QBVGaZ4pbDaZmVojVp/9qH/yJS9d18ZF7t84C0lLpFxFNjMc10Cz5WKg5TH+nogxDZRTxJFklH4gynH+/eNqOHnlyTbo4y5I80RdeyKDr7qkktZ63 vcxlgen-ae3"
  ];

  aranciniRev1 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/RD4fEVQ5lDFu8UDXtBx7HBTcyiUQQAW3qOSfgJZLQ asplos"
  ];
  aranciniRev2 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIAzr/1ZzUD9QPa6CF3NrtvdG4aw6NZ+qp2jnTXXuNeU asplos"
  ];

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
    # vCXLGen ASPLOS AE reviewer 1
    vcxlgenRev1 = {
      isNormalUser = true;
      home = "/scratch/vcxlgenRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4300;
      allowedHosts = [ "xavier" ];
      openssh.authorizedKeys.keys = vcxlgenRev1;
    };
    # vCXLGen ASPLOS AE reviewer 2
    vcxlgenRev2 = {
      isNormalUser = true;
      home = "/scratch/vcxlgenRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4303;
      allowedHosts = [ "xavier" ];
      openssh.authorizedKeys.keys = vcxlgenRev2;
    };
    # vCXLGen ASPLOS AE reviewer 3
    vcxlgenRev3 = {
      isNormalUser = true;
      home = "/scratch/vcxlgenRev3";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4304;
      allowedHosts = [ "xavier" ];
      openssh.authorizedKeys.keys = vcxlgenRev3;
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
    fastRev4 = {
      isNormalUser = true;
      home = "/scratch/fastRev4";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4310;
      allowedHosts = [ "irene" ];
      openssh.authorizedKeys.keys = fastRev4Key;
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
  ];
}
