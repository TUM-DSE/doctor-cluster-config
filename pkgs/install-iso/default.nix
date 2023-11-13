{ self, pkgs, ... }:

let
  inherit (self.inputs) nixos-generators;
  defaultModule = { ... }: {
    imports = [
      ./base-config.nix
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
