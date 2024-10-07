{
  self,
  inputs,
  config,
  ...
}:
{
  srvos.flake = self;
  srvos.registerSelf = true;
  # Nice for kernel hacking: https://blog.thalheim.io/2022/12/17/hacking-on-kernel-modules-in-nixos/
  # nix develop "$(realpath /run/booted-system/flake)#nixosConfigurations.$(hostname).config.boot.kernelPackages.kernel"
  system.extraSystemBuilderCmds = ''
    ln -s ${self} $out/flake
  '';

  nix.registry = {
    home-manager.flake = inputs.home-manager;
    nixpkgs.flake = inputs.nixpkgs;
  };

  nix.nixPath = builtins.map (name: "${name}=flake:${name}") (builtins.attrNames config.nix.registry);
}
