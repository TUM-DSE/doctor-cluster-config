# Setting up new hosts

Here we assume `$hostname` to be the hostname (such as yasmin) and `$host` a resolvable (as in `ssh root@$host`).

To open a shell with required tools installed (such as sops) you can use the nix package manager `nix develop`.

## Overview

High-level checklist for adding a new server:

1. [Physical setup](#physical-setup) — install hardware, add labels
2. [Register in Struktur DB](#struktur-db) — add IPMI and general MAC
3. [Add server config skeleton](#add-server-config) — IPs, keys, host config
4. [Boot NixOS installer](#boot-nixos-installer) — USB (preferred) or netboot
5. [Generate hardware config](#generate-hardware-config) — if no existing hardware module for this board
6. [Add hardware & disko config](#add-disko-config) — wire up ZFS disk layout
7. [Install NixOS](#install-nixos)
8. [IPMI / UEFI setup](#ipmi--uefi-setup) — set IPMI password, enable serial over LAN
9. [Prepare for server room](#prepare-for-server-room) — update Struktur DB subnets & MAC, contact RBG
10. [Enable NFS](#enable-nfs) — add NFS client module once server is in the server room
11. [Post-install finalization](#finalizing)

## Physical Setup

- Install any additional hardware (network card, drives, etc.)
- Add hostname labels to the front and back of the server

## Struktur DB

Add the server to the Struktur DB at https://struktur.ito.cit.tum.de (login with your ITO login, without `@cit.tum.de`).

Add two new hosts: `$hostname` and `$hostname-mgmt`:

- For domain choose `dos.cit.tum.de`
- For hosttype choose `server`
- If setting up in the lab, add to the `il01` network; otherwise use `il01_16` for the data network and `il01_15` for the mgmt/IPMI network (see the [Networking section of the README](../README.md))
- For `$hostname`: add the general (data network) MAC address
- For `$hostname-mgmt`: add the IPMI MAC address

Domain format: `$hostname.dos.cit.tum.de` and `$hostname-mgmt.dos.cit.tum.de`

## Add Server Config

### 1. Add IP addresses

Add the server's IPv4 and IPv6 addresses to `modules/hosts.nix`.

### 2. Generate keys and secrets

```
inv add-server $host
```

This generates the host keys, adds an entry to `.sops.yaml`, creates `hosts/$hostname.yml`, adds the age public key to `pubkeys.json`, and generates an SSH certificate.

### 3. Write a host config

Write a sane, simple configuration to `hosts/$hostname.nix`:

```nix
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/$hardwarename.nix
#    ../modules/nfs/client.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-<MANUFACTURER>_<MODEL>_<SERIAL>";

  networking.hostName = "$hostname";

  system.stateVersion = "checkwhatversiontheotherfilesuse";
}
```

Add `hosts/$hostname.nix` in `configurations.nix`.

### 4. Temporary bootloader flag

For the next section (Install NixOS), you need to set `boot.loader.efi.canTouchEfiVariables = true;` in `modules/bootloader.nix` to install the bootloader into EFI. Don't commit this change — outside of fresh installs, we don't want to touch efivars.

## Boot NixOS Installer

### Via USB / IPMI (preferred)

> **Note:** USB/IPMI boot of NixOS ISO appears to be broken on Supermicro servers.

Build a USB drive image to flash onto a USB stick (`$usbdev` e.g. `/dev/sdi`):

```
nix build .#install-iso
sudo dd status=progress bs=4M conv=fsync oflag=direct iflag=direct if=$(echo ./result/iso/nixos-*.iso) of=$usbdev
```

Boot from that ISO and connect via SSH.

> **Note:** If you have a jump host configured in your SSH config (e.g. `ProxyJump` for the cluster), it will likely not work. Connect directly using the server's IP address instead: `ssh root@<ip-address>`.

### Via Netboot (untested)

```
nix shell .#netboot-pixie-core --command "sudo netboot-pixie-core"
```

This offers a NixOS installer image via PXE network boot. Boot the server from the network. Given that your SSH key is in `modules/users.nix`, connect via `ssh root@$host` once it's up. Make sure your ssh-agent is running for later `inv` commands to work.

## Generate Hardware Config

> **Skip this step** if a hardware module already exists for your mainboard/server type in `modules/hardware/`.

Once booted into the installer, generate a hardware config:

```
nixos-generate-config --no-filesystems --dir .
```

Copy the result into `modules/hardware/$hardwarename.nix`. Add the following imports to that file:

```nix
imports = [
  ../disko-zfs.nix      # ZFS disk layout
  ../ipmi-supermicro.nix  # only for Supermicro boards
];
```
--phases kexec
Then stage the file:

```
git add modules/hardware/$hardwarename.nix
```

## Add Disko Config

The disko module configures the ZFS disk layout. There are two patterns depending on whether the hardware module already imports `disko-zfs.nix`:

- **New hardware module** (you just created it): the `../disko-zfs.nix` import is already in the hardware module (see above). Just set `disko.rootDisk` in `hosts/$hostname.nix`.
- **Existing hardware module without disko** (e.g. `supermicro-AS-4124GS.nix`): add `../modules/disko-zfs.nix` as an import in `hosts/$hostname.nix`.

In `hosts/$hostname.nix`, set the root disk using a stable by-id path:

```nix
disko.rootDisk = "/dev/disk/by-id/nvme-<MANUFACTURER>_<MODEL>_<SERIAL>";
```

Find the correct path on the booted installer:

```
ls /dev/disk/by-id/
```

## Install NixOS

Once the config is ready and the server is booted into the installer:

```
inv ssh-install-nixos --machine $host --hostname root@$host
```

## IPMI / UEFI Setup

> **Note:** If the server is in the `il01` network, the IPMI is not reachable from eduroam — even with the DOS VPN. You must be connected via a physical cable.

Open the IPMI administration page in your browser and set the IPMI login password to the credentials defined in `sops secrets.yml`.

> **Note (Gigabyte BMC):** The default login username is either `admin` or `root`.

Make sure the system is booted into EFI:

```
[root@nixos:~]# mount | grep efivars
efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
```

Enable IPMI serial over LAN (run `nix-shell -p ipmitool` on the same machine):

```console
ipmitool sol set privilege-level admin
ipmitool sol set force-encryption false
ipmitool sol set enabled true
ipmitool sol payload enable
```

Some motherboards might use a different channel instead of the default `0`, append channel number `1` to each command:

```
ipmitool sol set privilege-level admin 1
ipmitool sol set force-encryption false 1
ipmitool sol set enabled true 1
ipmitool sol payload enable 1
```

Also make sure IPMI over LAN is enabled in the BMC web interface and Serial over LAN redirection is enabled in the BIOS/firmware setup page (vendor-specific).

## Prepare for Server Room

### Update Struktur DB

- For `$hostname-mgmt`: the `il01_15` mgmt network does not support IPv6 — change the IP from IPv6 to an IPv4 address first, then switch the network from `il01` to `il01_15`.
- For `$hostname`: switch the network from `il01` to `il01_16` (data network).
- Update the MAC address for `$hostname` to the SFP NIC's MAC address (replace the onboard NIC MAC used during initial lab setup).

### Labels

Ensure hostname labels are attached to the front and back of the server before it goes into the server room.

### Contact RBG

Send an email to RBG to request the physical infrastructure for the server room slot. Include:

- Number of power slots needed
- 1x SFP fiber uplink (data network)
- 1x CAT ethernet for management/IPMI
- No redundant SFP links needed
- Server name and where to find it (normally our HW lab)
- MAC addresses of the SFP NIC and the mgmt/IPMI NIC
- Agreed rack location (this should be discussed with RBG before purchasing the server)

## Enable NFS

Once the server is physically installed in the server room and has network access to the NFS server, add the NFS client module to the host config in `hosts/$hostname.nix`:

```nix
imports = [
  ...
  ../modules/nfs/client.nix
];
```

Deploy the updated config to make NFS mounts available.

## Finalizing

Once the server is installed in the server room:

- ensure again that the networks in the Struktur DB are set correctly
- add host to `tasks.py` (`HOSTS` and `MANUFACTURERS`) and commit `inv update-docs`
- add host to `docs/README.md`
- fix up warnings in the nixos config
- add the host to monitoring in [`modules/monitoring/prometheus-targets.nix`](../modules/monitoring/prometheus-targets.nix) (see [monitoring.md](./monitoring.md))

## Obsolete: legacy pre-partitioned install

For legacy systems that are already partitioned, adapt the nixos-anywhere command from `inv ssh-install-nixos` to install into the pre-partitioned system without reformatting.
