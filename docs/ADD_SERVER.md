# Setting up new hosts

Here we assume `$hostname` to be the hostname (such as yasmin) and `$host` a resolvable (as in `ssh root@$host`).

To open a shell with required tools installed (such as sops) you can use the nix package manager `nix develop`.


## First Steps

First, establish a direct connection (1 to 1, ideally no switch) with the server and set up your machine as a gateway. 
On NixOS you can use the module described here [dnsmasq.nix](DNSMASQ.md).

Set the IPMI login to the credentials defined in `sops secrets.yml`.


## PXEBoot


Offer an image via pixie network boot and boot the server from it:

```
nix shell .#netboot-pixie-core --command "sudo nixboot-pixie-core"
```

Given that your ssh key is in module/users.nix you may connect now via `ssh root@$host` to check out `lsblk` or fix internet connectivity. 
Take care that your ssh-agent is working for later inv commands to work. 


## IPMI / UEFI

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


## TODO SSH CA

TODO, `ssh-ca-sign` is not yet part of doctor-cluster-config

Ssh ca certificate, so that hosts automatically trust each other.
``` console
$ HOST=astrid
$ IP=IP_OR_HOSTNAME_FOR_SCANNING
$ ./ssh-ca-sign $HOST,$HOST.r,$HOST.dse.in.tum.de,$HOST.thalheim.io $IP
$ mv $IP-cert.pub ./modules/sshd/certs/$HOST-cert.pub
```

## Prepare NixOS config

Prepare a config for a new host:

Generate a sops key for `$hostname` (from the ssh identity of the pxebooted OS)

```
inv print-age-key $host
```

in .sops.yaml, add the printed key in `keys:` and add a `creation-rule:` for `hosts/$hostname.yml`

```
vim .sops.yml
```

With that creation rule we can create and populate `hosts/$hostname.yml` secrets with a random `root-password:`

```
sops hosts/$hostname.yml
```

Generate a `hardware-configuration.nix` on the server with `nixos-generate-config --dir .` and copy it into `modules/hardware/$hardwarename.nix`.

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

Push config to github master branch (becuase the server will pull the commit from there during installation).

## Install NixOS

Format the disk

```
# if machine has nvme 
  inv format-disks --hosts $host  --disk /dev/nvme0n1
# if machine has ssd
  inv format-disks --hosts $host  --disk /dev/sda
```

Install nixOS

```
inv install-nixos --hosts $host  --flakeattr $hostname
```

Finally, note down the MAC addresses of the relevant NICs (and the IPMI) which are printed by install-nixos to give them to the admins. 

