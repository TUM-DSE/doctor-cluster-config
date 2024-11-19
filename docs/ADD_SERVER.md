# Setting up new hosts

Here we assume `$hostname` to be the hostname (such as yasmin) and `$host` a resolvable (as in `ssh root@$host`).

To open a shell with required tools installed (such as sops) you can use the nix package manager `nix develop`.

## Secret Generation

Generate the configuration and keys for the host: 

```
inv add-server $host
```

## Prepare NixOS config

Prepare a config for a new host:

> **If** there is no hardware configuration yet for your mainboard/server type: 
> Generate a `hardware-configuration.nix` on the server with `nixos-generate-config --no-filesystems --dir .` and copy it into `modules/hardware/$hardwarename.nix`. 
> You can use `inv reformat-install-nixos wrongHostname $eth0` with a wrong hostname to netboot the server.
> It will print an ssh command you can use to ssh into it.

Write a sane, simple configuration to `hosts/$hostname.nix`:

```nix
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/$hardwarename.nix
  ];

  networking.hostName = "$hostname";

  system.stateVersion = "checkwhatversiontheotherfilesuse";
}
```

Add `hosts/$hostname.nix` in `configurations.nix`.

For the next section (Install NixOS), you need to set `boot.loader.efi.canTouchEfiVariables = true;` in `modules/bootloader.nix` to install the bootloader into EFI. Don't commit this change though, because outside of fresh installs, we don't want to touch efivars.

## Install NixOS

We boot the `github:nix-community/nixos-images/pxe-boot#netboot-installer-nixos-unstable`.
The following script expects the server to be connected to your physical LAN port `$eth0` which will act as a router. 
The script will also print the ip of the server you can connect to via ssh. 

Tell your network manager not to use `$eth0`. Example for gnome/ubuntus `NetworkManager`: `nmcli dev set $eth0 managed no`.

Stop your local dnsmasq, if you have one: `systemctl stop dnsmasq`.

Format the disks and install nixos on the server:

```
inv netboot-install-nixos $host $eth0
```

Finally, note down the MAC addresses of the relevant NICs (and the IPMI) which are printed by install-nixos to give them to the chair admins. 

## Install NixOS via USB stick

Build a USB drive image to flash onto a USB stick (`$usbdev` e.g. `/dev/sdi`).

```
nix build .#install-iso
sudo dd status=progress bs=4M conv=fsync oflag=direct iflag=direct if=$(echo ./result/iso/nixos-*.iso) of=$usbdev
```

Boot from that iso, make sure you can connect to it via ssh and install the system:

```
inv ssh-install-nixos --machine $host --hostname root@$host
```

## Finializing

Once the server is installed in the server room:

- fix up warnings in the nixos config
- ensure hostname labels are on front and back of the server
- add the nfs client module to the servers config
- include it to monitoring, backup services and retiolum
- change PXE boot interface to the one plugged in at the server room

## Misc: IPMI / UEFI

IPMI administration page in your browser and set the decrypted IPMI login to the credentials defined in `sops secrets.yml`.

In this step you try to find sane IPMI and UEFI settings.

Make sure the system is booted into EFI:

```
[root@nixos:~]# mount | grep efivars
efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
```

Also make sure to enable IPMI serial over lan (run `nix-shell -p ipmitool` on the same machine):

```console
ipmitool sol set privilege-level admin
ipmitool sol set force-encryption false
ipmitool sol set enabled true
ipmitool sol payload enable
```

Some motherboards might use a different channel instead of the default `0`, append some other number
i.e. `1` to each command than

```
ipmitool sol set privilege-level admin 1
ipmitool sol set force-encryption false 1
ipmitool sol set enabled true 1
ipmitool sol payload enable 1
```

Also make sure IPMI over lan is enabled in the BMC website and Serial over lan
redirection is enabled in the BIOS/firmware setup page (vendor-specific).

## Obsolete: Our pxe boot image


Offer an image via pixie network boot and boot the server from it:

```
nix shell .#netboot-pixie-core --command "sudo netboot-pixie-core"
```

Given that your ssh key is in `module/users.nix`, you may connect now via `ssh root@$host` to check out `lsblk` or fix internet connectivity. 
Take care that your ssh-agent is working for later inv commands to work. 

## Obsolete:

legacy systems can be installed via 

- `inv format-disk`
- adapt the nixos-anywhere command called by `inv reformat-install-nixos` to install into your pre-partitioned system
