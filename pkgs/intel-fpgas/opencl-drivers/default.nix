{ stdenv }:
# source: https://www.intel.com/content/www/us/en/software-kit/660540/intel-fpga-sdk-for-opencl-pro-edition-software-version-20-2.html
# in Linux BSP: test/board/s10_ref/linux64/libexec/install (the `aocl install` command) installs this udev rule
stdenv.mkDerivation {
  name = "intel-opencl-driver";
  src = ./.;
  installPhase = ''
    mkdir -p $out/lib/udev/rules.d/
    cp -v *.rules $out/lib/udev/rules.d/

    # This is a false-positive in the udev nixos build script but we fix it
    # anyway.
    sed -i -e 's!/sbin/udevcontrol!udevcontrol!' $out/lib/udev/rules.d/*.rules
  '';
}
