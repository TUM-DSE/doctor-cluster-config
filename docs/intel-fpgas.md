# Intel FPGAs

## Software

We assume version `X` of Intel Quartus Prime Pro is installed in `/share/intel-fpga/tools/X`.
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

To install another version of Quartus, download [Quartus Prime Pro for Linux](https://www.intel.com/content/www/us/en/software-kit/794624/intel-quartus-prime-pro-edition-design-software-version-23-4-for-linux.html) under "Complete Download".

Extract the tar file, run `./setup_pro.sh` in a graphical environment and use the graphical installer to install everything.
Finally, copy the shell.nix file from another version to the new install location and adjust `INSTALL_DIR`.

### License

Quartus Prime Pro requires a license.
The license files are located at `/share/intel-fpga/licenses/`.
The current license is only valid on our server rose and **will expire on the 1st of March 2025**.

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
