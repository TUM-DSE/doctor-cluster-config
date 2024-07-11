{ self, pkgs, ... }:

let
  defaultModule = { ... }: {
    imports = [
      ./base-config.nix
      ./nix-settings.nix
      self.inputs.sops-nix.nixosModules.default
    ];
    _module.args.inputs = self.inputs;
  };
in
self.inputs.nixos-generators.nixosGenerate {
  inherit pkgs;
  modules = [
    defaultModule
  ];
  format = "install-iso";
}
