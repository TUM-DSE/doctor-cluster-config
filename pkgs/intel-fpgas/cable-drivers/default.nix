{ stdenv, pkgs, ... }:
# source: https://www.intel.com/content/www/us/en/docs/programmable/683719/current/installing-the-driver-on-linux-systems.html
stdenv.mkDerivation {
  name = "intel-cable-driver";
  src = ./.;
  installPhase = ''
    mkdir -p $out/lib/udev/rules.d/
    cp -v *.rules $out/lib/udev/rules.d/

    cat >> $out/lib/udev/rules.d/51-usbblaster.rules << EOF
    # Arrow USB Programmer, used by Napatech F2070X IPU
    SUBSYSTEM=="usb",\
    ENV{DEVTYPE}=="usb_device",\
    ATTR{idVendor}=="0403",\
    ATTR{idProduct}=="6010",\
    MODE="0666",\
    NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}",\
    RUN+="${pkgs.coreutils}/bin/chmod 0666 %c"
    # Interface number zero is a JTAG
    SUBSYSTEM=="usb",\
    ATTRS{idVendor}=="0403",\
    ATTRS{idProduct}=="6010",\
    ATTR{interface}=="Arrow USB Blaster*",\
    ATTR{bInterfaceNumber}=="00",\
    RUN="${pkgs.bash}/bin/bash -c 'echo $kernel > /sys/bus/usb/drivers/ftdi_sio/unbind'"
    EOF

    # This is a false-positive in the udev nixos build script but we fix it
    # anyway.
    sed -i -e 's!/sbin/udevcontrol!udevcontrol!' $out/lib/udev/rules.d/*.rules
  '';
}
