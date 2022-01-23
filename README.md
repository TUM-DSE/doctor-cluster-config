All hostnames can be looked up in [./hosts](./hosts). Most of the servers are in
[TU Munich](docs/tum). Some machines are in [Edinburgh](docs/edinburgh).

# Update all servers

1. Install [pyinvoke](https://github.com/pyinvoke/invoke) and rsync via pip or load via `nix develop`
2. Choose a deployment target:


``` console
$ inv -l
Available tasks:

  cleanup-gcroots
  deploy-doctor      Deploy to rpi4, that is used to control power relay
  deploy-edinburgh   Deploy to edinburgh servers starting with rose
  deploy-tum         Deploy to TUM servers
  reboot             Reboot hosts. example usage: fab --hosts clara.r,donna.r reboot
```

3. Run!

``` console
$ inv deploy-tum
```

# Add new users

Add chair members to [./modules/users.nix](./modules/users.nix) and students to [./modules/students.nix](./modules/students.nix).

For chair members use a uid in the 1000-2000. For new students use a uid in the
2000-3000 range. Check that the uid is unique across both files and in the
range between to avoid conflicts.

# Add a new host

New hosts are added in configurations.nix.

# Update system

We use [flakes](https://nixos.wiki/wiki/Flakes) to manage 
nixpkgs versions. To upgrade use:

``` console
$ nix flake update
```

Than commit `flake.lock`.

# Home-manager

To install home-manager for a user simply run:

``` console
$ nix-shell '<home-manager>' -A install
```

This will initiate your home-manager and will generate a file similar to the one in ```home/.config/nixpkgs/home.nix```

# Visual Studio Code Server support in NixOS

You can use [this](https://github.com/msteen/nixos-vscode-server) to enable support for VS Code Server in NixOS.

An example of the ```home.nix``` configured for VS Code support is shown in ```home/.config/nixpkgs/home.nix```.

# Installation

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


## Partitioning

TODO: partitioning is no longer manual...

Assuming `/dev/nvme0n1` is the root disk, the following commands will setup up zfs and one
partition formatted as fat32 (used for efi boot).

```console
# Creates gpt partition table with one 500MB partition for boot and the rest for zfs
$ sgdisk -n 1:0:+500M -N 2 -t 1:ef00 -t 2:8304 /dev/nvme0n1
# this what the result might look like
$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0         7:0    0 593.4M  0 loop /nix/.ro-store
nvme0n1       8:0    0 894.3G  0 disk
├─nvme0n1p1   8:1    0   500M  0 part
└─nvme0n1p2   8:2    0 893.8G  0 part
# format boot partition
$ mkfs.vfat -b32 /dev/nvme0n1p1
# Add a label, that we can use to reliable mount /boot later
$ dosfslabel /dev/nvme0n1p1 boot
# Create a zpool for zfs
$ zpool create -f zroot /dev/nvme0n1p2
# Create zfs datasets: 
# - zroot/root/nixos for the /
# - zroot/root/tmp for /tmp
# - zroot/nixos/home for /home
# - zroot/reserved in case we run out-of-disk space (can be deleted in this case)
# - zroot/docker for docker
zfs create -o acltype=posixacl -o xattr=sa -o compression=lz4 -o mountpoint=none zroot/root
zfs create -o mountpoint=legacy -o setuid=off -o devices=off -o sync=disabled zroot/root/tmp
zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=true zroot/root/home
zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=true zroot/root/nixos
zfs create -o mountpoint=none -o refreservation=1G zroot/reserved
zfs create -o mountpoint=none -o compression=lz4 zroot/docker
# mount zfs root to /mnt
$ mount -t zfs zroot/root/nixos /mnt
# prepare mountpoints for home,tmp,boot
$ mkdir /mnt/{home,tmp,boot}
# mount boot partition
$ mount /dev/nvme0n1p1 /mnt/boot/
# mount home partition
$ mount -t zfs zroot/root/home /mnt/home/
# mount temp partition
$ mount -t zfs zroot/root/tmp /mnt/tmp/
# fix permissions on tmp (important!)
$ chmod 777 /mnt/tmp
```

## Prepare NixOS configuration

TODO: this is now automated as well

```console
# We are are just interested in the hardware-configuration.nix that NixOS might come up for this hardware.
# Compare /tmp/nixos/hardware-configuration.nix with hardware-configuration.nix we have in the repo
# and make changes as needed.
$ nixos-generate-config --root /mnt --dir /tmp/nixos
# clone configuration to new server
$ mkdir -p /mnt/etc/nixos
$ nix-shell -p git --run 'git clone https://github.com/Mic92/doctor-cluster-config /mnt/etc/nixos && git -C /mnt/etc/nixos submodule update --init'
# Generates keys for tinc
$ nix-shell -p tinc --run 'mkdir -p /mnt/etc/tinc/retiolum && sudo tincd --generate-keys -c /mnt/etc/tinc/retiolum -n retiolum'
# pick a new hostname and and copy configuration for it
$ cp hosts/clara.nix hosts/$newname.nix
# copy ssh keys from the installer to the new system (requires sshd service to be started)
# also share this public key (ssh_host_ed25519_key.pub) with @Mic92 to get a ssh certificate
$ mkdir -p /mnt/etc/ssh
$ cp /etc/ssh/ssh_host_* /mnt/etc/ssh
# the ssh certificate needs to go to modules/sshd/certs/$newname-cert.pub
# Than adjust configuration in $newname.nix
# Also add the new host in configurations.nix
# We primarly need a new tinc ip address for the vpn following https://github.com/Mic92/retiolum
# Also share in this step the key generated to /mnt/etc/tinc/retiolum
$ vim /mnt/etc/nixos/hosts/$newname.nix
# add ip address of the machine to
$ vim /mnt/etc/nixos/modules/hosts.nix
# Than run nixos-install
$ nix-shell -p nixFlakes -p git --run 'nixos-install --flake /mnt/etc/nixos#$newname'
```

## Adding keys...

TODO, `ssh-ca-sign` is not yet part of doctor-cluster-config

Ssh ca certificate, so that hosts automatically trust each other.
``` console
$ HOST=astrid
$ IP=IP_OR_HOSTNAME_FOR_SCANNING
$ ./ssh-ca-sign $HOST,$HOST.r,$HOST.dse.in.tum.de,$HOST.thalheim.io $IP
$ mv $IP-cert.pub ./modules/sshd/certs/$HOST-cert.pub
```

## IPMI

On all new TUM rack machines we have IPMI support!!!

Generally, you can find the IPMI web interface at
`https://$HOST-mgmt.dse.in.tum.de/` (i.e. [https://bill-mgmt.dse.in.tum.de]())
once the device has been installed in the rack.  These addresses are only
available through the management network, so you must use the [RBG
vpn](https://vpn.rbg.tum.de/) for il1 to access them.

You can also retrieve the IP addresses assigned to the IPMI/BMC firmware by
running:

```
ipmitool lan print
```

on the machine. On the other host (i.e. your laptop) you can run the following command to get a serial console:

```
$ ipmitool -I lanplus -H <ipmi-ip-address> -U ADMIN -P "$(sops -d --extract '["ipmi-passwords"]' secrets.yml)" sol activate
```

The following will reboot the machine:

```
$ ipmitool -I lanplus -H <ipmi-ip-address> -U ADMIN -P "$(sops -d --extract '["ipmi-passwords"]' secrets.yml)" power cycle 
```

The IPMI password here is encrypted with
[sops](https://github.com/mozilla/sops). To decrypt it on your machine, your
age/pgp fingerprint must be added to `.sops.yaml` in this repository. And one of
the existing users must re-encrypt `secrets.yml` with your key. 

Then press enter to get a login prompt. The root password for all machines is
also stored in [secrets.yaml]().

# Monitoring

Hosts are monitored here: https://grafana.thalheim.io/d/Y3JuredMz/monitoring?orgId=1
