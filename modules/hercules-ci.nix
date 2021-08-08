{ config, lib, pkgs, ... }:
{
  services.hercules-ci-agent = {
    enable = true;
    settings = {
      clusterJoinTokenPath = "/etc/nixos/secrets/hercules-join-token";
      binaryCachesPath = "/etc/nixos/secrets/hercules-binary-cache";
    };
  };
}
