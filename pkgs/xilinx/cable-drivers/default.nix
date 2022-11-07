{ stdenv }:
# taken from vivado 2021.2
stdenv.mkDerivation {
  name = "xilinx-cable-driver";
  src = ./.;
  installPhase = ''
    mkdir -p $out/lib/udev/rules.d/
    cp -v *.rules $out/lib/udev/rules.d/

    # This is a false-positive in the udev nixos build script but we fix it
    # anyway.
    sed -i -e 's!/sbin/udevcontrol!udevcontrol!' $out/lib/udev/rules.d/*.rules
  '';
}
