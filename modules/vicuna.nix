{ pkgs
, lib
, config
, ...
}:
let
  dir = "/var/lib/vicuna";
  commonServiceConfig = {
    StateDirectory = "vicuna";
    WorkingDirectory = dir;
    User = "vicuna";
    Group = "vicuna";
  };
in
{
  networking.firewall.allowedTCPPorts = [ 80 ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."vicuna.r" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:7861";
        proxyWebsockets = true;
      };
    };
  };
  users.users.vicuna = {
    isSystemUser = true;
    home = dir;
    group = "vicuna";
  };
  users.groups.vicuna = {};

  # flake.nix
  #{
  #  description = "Vicuna flake";                            
 
  #  inputs = {
  #    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  #    nixpkgs.url = "github:TUM-DSE/nixpkgs/release-22.05-backports";
  #    flake-parts.url = "github:hercules-ci/flake-parts";
  #    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  #  };
 
  #  outputs = inputs@{ flake-parts, nixpkgs, ... }:
  #    flake-parts.lib.mkFlake { inherit inputs; } ({ lib, ... }: {
  #      systems = lib.systems.flakeExposed;
  #      perSystem = { system, pkgs, lib, ... }: {
  #        _module.args.pkgs = import nixpkgs {
  #          inherit system;
  #          config.allowUnfree = true;
  #        };
  #        packages.default = pkgs.mkShell {
  #          packages = [
  #            pkgs.bashInteractive
  #            (pkgs.python3.withPackages (ps: [
  #            ]))
  #          ];
  #          buildInputs = [ pkgs.cudatoolkit pkgs.git-lfs ];
  #          NIX_LDFLAGS = [ "-L${pkgs.cudatoolkit}/lib/stubs" ];
  #          shellHook = ''
  #            export CUDA_PATH=${pkgs.cudatoolkit}
  #            export CUDA_HOME=${pkgs.cudatoolkit}
  #            export CUDA_VERSION=${pkgs.cudatoolkit.version}
  #            export EXTRA_LDFLAGS="-L/run/opengl-driver/lib"
  #            export LD_LIBRARY_PATH=/run/opengl-driver/lib:${lib.makeLibraryPath [ pkgs.cudatoolkit pkgs.stdenv.cc.cc ]}              
  #          '';
  #        };
  #      };
  #    });
  #}
  #
  # .envrc:
  # use flake
  # layout python

  systemd.services.fastchat-direnv-allow = {
    wantedBy = [ "multi-user.target" ];
    path = [ config.nix.package pkgs.git ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      StateDirectory = "vicuna";
      WorkingDirectory = dir;
      User = "vicuna";
      Group = "vicuna";
      ExecStart = "${lib.getExe pkgs.direnv} allow ${dir}";
    };
  };

  systemd.services.fastchat-worker = {
    wantedBy = [ "multi-user.target" ];
    after = [ "fastchat-direnv-allow.service" ];
    path = [ config.nix.package pkgs.git ];
    # for direnv to work
    environment.HOME = dir;
    environment.LD_LIBRARY_PATH = "${pkgs.cudatoolkit_11}/lib64";

    serviceConfig = commonServiceConfig // {
      ExecStart = "${lib.getExe pkgs.direnv} exec ${dir} python3 -m fastchat.serve.model_worker --model-path ${dir}/models/vicuna-13b";
    };
  };

  systemd.services.fastchat-controller = {
    wantedBy = [ "multi-user.target" ];
    after = [ "fastchat-direnv-allow.service" ];
    path = [ config.nix.package pkgs.git ];
    # for direnv to work
    environment.HOME = dir;

    serviceConfig = commonServiceConfig // {
      ExecStart = "${lib.getExe pkgs.direnv} exec ${dir} python3 -m fastchat.serve.controller";
    };
  };

  systemd.services.fastchat-web = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    after = [ "fastchat-direnv-allow.service" ];
    path = [ config.nix.package pkgs.git ];
    # for direnv to work
    environment.HOME = dir;

    serviceConfig = commonServiceConfig // {
      ExecStart = "${lib.getExe pkgs.direnv} exec ${dir} python3 -m fastchat.serve.gradio_web_server --port 7861";
    };
  };
}
