# Intel FPGAs

## Software

We assume version `X` of Intel Quartus Prime Pro is installed in `/share/intel-fpga/tools/X`.
Installed versions: 20.2, 23.4, 24.1, 25.1 and 26.1.
You probably want to use the highest version available.

To use any of the Intel FPGA tools, enter an environment with the required software dependencies and environment variables:

```sh
nix-shell /share/intel-fpga/tools/X/shell.nix
```

### Run Quartus

Launch Quartus in a graphical environment from the command line:

```sh
quartus
```

### Install Quartus

Download the Quartus Prime Pro installer (`qinst-linux-<version>.run`, under "Installer") from
Altera's download center; this needs a free Altera account. Store it in
`/share/intel-fpga/downloads/<version>/`. The installer downloads the components without a
login. Run it inside an FHS environment, for example fpga-nix's `mkQuartusShell`:

```sh
sh qinst-linux-<version>.run --target qinst --noexec
qinst/qinst.sh --cli --accept-eula \
  --download-dir /share/intel-fpga/downloads/<version> \
  --install-dir /share/intel-fpga/tools/<version> \
  --components quartus,questa_fse,flexlm,agilex7,agilex5,agilex3,cyclone10gx
```

Record the downloads' checksums in `SHA1SUMS` next to them. For OFS, also install the OFS IP
license from the FIM repository (`license/quartus-0.0-0.02iofs-linux.run`, kept in
`/share/intel-fpga/downloads/ofs/`) with
`--mode unattended --accept_eula 1 --installdir /share/intel-fpga/tools/<version>`.

### License

The license files are located at `/share/intel-fpga/licenses/`.

- **Floating licenses**, served by a FlexNet license server on xavier
  (`modules/intel-fpga-license/server.nix`, unit `intel-fpga-license-server`).
  Altera binds them to xavier's NIC (`58A2E12D919E`), so the server can only run there.
  The files contain placeholders; the service writes filled-in copies to its runtime
  directory and leaves the originals untouched.
  - lmgrd: port 27010, alterad (Quartus): 27011, mgcld (Questa): 27012
  - Use them with `export LM_LICENSE_FILE=27010@xavier.dos.cit.tum.de`.
  - Check the server with
    `/share/intel-fpga/tools/26.1/flexlm/lmutil lmstat -a -c 27010@xavier.dos.cit.tum.de`.
- **Node-locked licenses** for adelaide (`LR-210504`, `-505`, `-508`, `-509`, `-512`, `-513`),
  usable without the server, but only on adelaide and not in sandboxed Nix builds.

The 90-day evaluation seats expire on 11 February 2027; the University bundle seats are
permanent. The floating files contain two distinct `quartus_pro` lines, so the server
serves 2 seats.

Quartus 25.1 and newer need FlexNet 11.19.6 or newer on the server; the service uses the
daemons from 26.1. Questa 25.1 and newer no longer ship `mgcld`, so it comes from 24.1.

#### Nix builds

A sandboxed build has no network, so it cannot reach the server. Hosts that import
`modules/intel-fpga-license/relay.nix` (adelaide, the hosts with `modules/intel-fpgas.nix`
and the nix-farm workers) expose each server port as a Unix socket in
`/run/intel-fpga-license` and add that directory and `/share/intel-fpga/tools` to the
sandbox. fpga-nix's `licenseRelay` (also in ofs-nix) forwards `127.0.0.1` inside the build
to these sockets:

```nix
licenseRelay.socketDir = "/run/intel-fpga-license";
```

doctor-cluster-xilinx exports this as `quartusLicenseRelay`.

### References

- [Intel Quartus Prime User Guides](https://www.intel.com/content/www/us/en/support/programmable/support-resources/design-software/user-guides.html)

## Napatech F2070X IPU

This section refers to the [Napatech F2070X Infrastructure Processing Unit (IPU)](https://www.napatech.com/products/f2070x-ipu/).

### Connect to the IPU

You can log in to the IPU using ssh:

```sh
ssh root@ipu.dos.cit.tum.de
```

Alternatively, you can use the USB UART cable for full access to the serial console, including UEFI and the GRUB menu:

```sh
sudo picocom -b 115200 /dev/serial/by-id/usb-FTDI_TTL-234X-3V3-WE_FT84ISZ2-if00-port0
```

The exact ID might be slightly different.

### References

- [Intel IPU product page](https://www.intel.com/content/www/us/en/products/details/network-io/ipu/f2000x-pl-platform.html)
- [Napatech IPU product page](https://www.napatech.com/products/f2070x-ipu/)
- [IPDK](https://ipdk.io/)
- [Hardware installation guide](https://docs.napatech.com/r/F2070X-Installation)
- [Accessing IPU OS guide](https://docs.napatech.com/r/Intel-Xeon-D-Processor-on-Napatech-IPUs)
