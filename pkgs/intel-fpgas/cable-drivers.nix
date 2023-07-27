{ stdenv }:
# source: https://www.intel.com/content/www/us/en/docs/programmable/683719/current/installing-the-driver-on-linux-systems.html
stdenv.mkDerivation {
  name = "intel-cable-driver";
  src = ./.;
  installPhase = ''
    mkdir -p $out/lib/udev/rules.d/
    cp -v *.rules $out/lib/udev/rules.d/

    # This is a false-positive in the udev nixos build script but we fix it
    # anyway.
    sed -i -e 's!/sbin/udevcontrol!udevcontrol!' $out/lib/udev/rules.d/*.rules
  '';
}
