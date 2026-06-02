{
  description = "Home Manager configuration";

  # update flake.lock to the latest inputs: `nix flake update`
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      username = "jdoe";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      mkHomeConfiguration =
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./home.nix ];
          extraSpecialArgs = {
            inherit username;
          };
        };

      homeConfigurationsBySystem = forAllSystems mkHomeConfiguration;
    in
    {
      homeConfigurations = nixpkgs.lib.mapAttrs' (
        system: homeConfiguration:
        nixpkgs.lib.nameValuePair "${username}-${system}" homeConfiguration
      ) homeConfigurationsBySystem;

      apps = forAllSystems (
        system:
        let
          switchApp = {
            type = "app";
            program = "${homeConfigurationsBySystem.${system}.activationPackage}/activate";
          };
        in
        {
          "switch-${username}-hm" = switchApp;
          switch = switchApp;
        }
      );
    };
}
