{
  perSystem =
    { pkgs, ... }:
    let
      prometheusTargets = import ./prometheus-targets.nix;

      # Convert target groups to Prometheus HTTP SD JSON format
      mkHttpSdJson =
        name: groups:
        pkgs.writeText "${name}.json" (builtins.toJSON groups);
    in
    {
      packages.prometheus-http-sd = pkgs.runCommand "prometheus-http-sd" { } ''
        mkdir -p $out
        cp ${mkHttpSdJson "telegraf" prometheusTargets.telegraf} $out/telegraf.json
      '';

      devShells.ansible = pkgs.mkShellNoCC {
        buildInputs = [
          pkgs.bashInteractive
          pkgs.ansible
        ];
      };
    };
}
