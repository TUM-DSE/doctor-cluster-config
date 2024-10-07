{ self, inputs, ... }:
{
  srvos.flake = self;
  # Nice for kernel hacking: https://blog.thalheim.io/2022/12/17/hacking-on-kernel-modules-in-nixos/
  # nix develop "$(realpath /run/booted-system/flake)#nixosConfigurations.$(hostname).config.boot.kernelPackages.kernel"
  system.extraSystemBuilderCmds = ''
    ln -s ${self} $out/flake
  '';
  nix.nixPath = [
    "home-manager=${inputs.home-manager}"
  ];
}
