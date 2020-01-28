{ lib, ...}: with lib; let
  hostOptions = {
    ipv4 = mkOption {
      type = types.str;
      description = ''
        own ipv4 address
      '';
    };
  };
in {
  options = {
    networking.doctorwho.hosts = mkOption {
      type = with types; attrsOf (submodule [ { options = hostOptions; } ]);
      description = "A host in our cluster";
    };
  };
  config = {
    networking.doctorwho.hosts = {
      amy.ipv4 = "129.215.165.57";
      clara.ipv4 = "129.215.165.58";
      donna.ipv4 = "129.215.165.54";
      martha.ipv4 = "129.215.165.53";
      rose.ipv4 = "129.215.165.52";
    };
  };
}
