{
  pkgs,
  config,
  self,
  lib,
  ...
}:
let
  packages = self.packages.${pkgs.stdenv.hostPlatform.system};
  xrt-drivers = packages.xrt-drivers.override { inherit (config.boot.kernelPackages) kernel; };
  coyote-driver = packages.coyote-driver.override { inherit (config.boot.kernelPackages) kernel; };

  # Usage: coyote-load [<module params>...]
  #   e.g. coyote-load ip_addr=10.0.0.1 mac_addr=00:0a:35:...
  # Loads a coyote_driver.ko that matches the *running* kernel.
  # NixOS kmod already searches /run/booted-system and /run/current-system,
  # so plain modprobe works whenever either generation was built with the
  # option enabled. The nix-build fallback covers the case where the
  # config's kernel has moved on but the machine has not rebooted yet.
  coyote-load = pkgs.writeShellApplication {
    name = "coyote-load";
    runtimeInputs = [ pkgs.kmod ];
    text = ''
      if sudo modprobe coyote_driver "$@"; then
        exit 0
      fi
      echo "coyote-load: modprobe failed, rebuilding against booted kernel via /run/booted-system/flake" >&2
      flake=$(realpath /run/booted-system/flake)
      host=$(cat /proc/sys/kernel/hostname)
      out=$(nix build --no-link --print-out-paths --impure --expr "
        let
          booted = (builtins.getFlake \"path:$flake\").nixosConfigurations.\"$host\".config;
          current = builtins.getFlake \"path:${self}\";
        in current.packages.${pkgs.stdenv.hostPlatform.system}.coyote-driver.override {
          inherit (booted.boot.kernelPackages) kernel;
        }")
      exec sudo insmod "$out/lib/modules/$(uname -r)/extra/coyote_driver.ko" "$@"
    '';
  };
in
{
  options = {
    hardware.xilinx.xrt-drivers.enable = lib.mkEnableOption "Propritary kernel drivers for flashing firmware";
    hardware.xilinx.coyote-driver.enable = lib.mkEnableOption "Coyote FPGA kernel driver";
  };

  config = {
    environment.systemPackages = [
      (packages.xilinx-env.override {
        xilinxName = "xilinx-shell";
        runScript = "bash";
      })
      (packages.xilinx-env.override {
        xilinxName = "vitis";
        runScript = "vitis";
      })
      # Versal-targeted variant: Vivado/Vitis 2025.1.
      # Required for V80 (the routed-locked static checkpoint Coyote ships
      # is built with Vivado 2024.2+, so 2023.2 cannot link against it).
      (packages.xilinx-env.override {
        xilinxName = "versal-shell";
        runScript = "bash";
        vivadoVersion = "2025.1";
      })
      packages.xntools-core
    ] ++ lib.optional config.hardware.xilinx.coyote-driver.enable coyote-load;

    services.udev.packages = [ packages.xilinx-cable-drivers ];

    # 6.0+ kernel
    boot.extraModulePackages =
      lib.optional config.hardware.xilinx.xrt-drivers.enable xrt-drivers
      ++ lib.optional config.hardware.xilinx.coyote-driver.enable coyote-driver;
    # coyote_driver is loaded manually (via `coyote-load`) after programming the FPGA,
    # so no boot.kernelModules entry.

    # hardware.graphics.extraPackages = [ packages.xrt ];
  };
}
