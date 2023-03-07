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

If there is no hardware configuratoin yet for your mainboard/server type: Generate a `hardware-configuration.nix` on the server with `nixos-generate-config --dir .` and copy it into `modules/hardware/$hardwarename.nix`.

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

## Install NixOS

We boot the `github:nix-community/nixos-images/pxe-boot#netboot-installer-nixos-unstable`.
The following script expects the server to be connected to your physical LAN port `$eth0` which will act as a router. 
The script will also print the ip of the server you can connect to via ssh. 

Format the disks and install nixos on the server:

```
inv reformat-install-nixos $host $eth0
```

Finally, note down the MAC addresses of the relevant NICs (and the IPMI) which are printed by install-nixos to give them to the chair admins. 


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


