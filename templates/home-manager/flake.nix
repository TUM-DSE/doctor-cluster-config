{
  description = "Home Manager configuration";

  # update flake.lock to latest nixos-23.11: `nix flake update`
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "jdoe";
    in
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit username;
        };
      };

      apps.${system}."switch-${username}-hm" = {
        type = "app";
        program = "${self.homeConfigurations.${username}.activationPackage}/activate";
      };
    };
}
