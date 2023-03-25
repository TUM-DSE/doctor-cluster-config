{ pkgs
, lib
, config
, ...
}:
let
  dir = "/var/lib/text-generation-webui";
in
{
  networking.firewall.allowedTCPPorts = [ 80 ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."llama.r" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:7861";
        proxyWebsockets = true;
      };
    };
  };
  users.users.llama = {
    isSystemUser = true;
    home = dir;
    group = "llama";
  };
  users.groups.llama = {};

  # flake.nix:
  #
  # {
  #   description = "Development environment for this project";

  #   inputs = {
  #     #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  #     nixpkgs.url = "github:TUM-DSE/nixpkgs/release-22.05-backports";
  #     flake-parts.url = "github:hercules-ci/flake-parts";
  #   };

  #   outputs = inputs@{ flake-parts, nixpkgs, ... }:
  #     flake-parts.lib.mkFlake { inherit inputs; } ({ lib, ... }: {
  #       systems = lib.systems.flakeExposed;
  #       perSystem = { system, pkgs, lib, ... }: {
  #         _module.args.pkgs = import nixpkgs {
  #           inherit system;
  #           config.allowUnfree = true;
  #         };
  #         packages.default = pkgs.mkShell {
  #           packages = [
  #             pkgs.bashInteractive
  #             (pkgs.python3.withPackages (ps: [
  #             ]))
  #           ];
  #           buildInputs = [ pkgs.cudatoolkit ];
  #           NIX_LDFLAGS = [ "-L${pkgs.cudatoolkit}/lib/stubs" ];
  #           shellHook = ''
  #             export CUDA_PATH=${pkgs.cudatoolkit}
  #             export CUDA_HOME=${pkgs.cudatoolkit}
  #             export CUDA_VERSION=${pkgs.cudatoolkit.version}
  #             export EXTRA_LDFLAGS="-L/run/opengl-driver/lib"
  #             export LD_LIBRARY_PATH=/run/opengl-driver/lib:${lib.makeLibraryPath [ pkgs.cudatoolkit pkgs.stdenv.cc.cc ]}
  #           '';
  #         };
  #       };
  #     });
  # }
  #
  # .envrc:
  # use flake
  # layout python

  systemd.services.text-generation-webui = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    path = [ config.nix.package pkgs.git ];
    # for direnv to work
    environment.HOME = dir;
    environment.LD_LIBRARY_PATH = "${pkgs.cudatoolkit_11}/lib64";

    serviceConfig = {
      StateDirectory = "text-generation-webui";
      WorkingDirectory = "${dir}/code";
      User = "llama";
      Group = "llama";
      ExecStartPre = "${lib.getExe pkgs.direnv} allow ${dir}/code";
      ExecStart = "${lib.getExe pkgs.direnv} exec ${dir}/code python3 server.py --model llama-30b-hf";
    };
  };
}
