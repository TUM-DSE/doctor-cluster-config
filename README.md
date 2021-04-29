# Update all servers

1. Log into rose
2. Change to `/etc/nixos`, do the configuration changes & run `git push`
3. Run `./update-all.sh` to deploy to all servers

# Add a new host

New hosts are added in configurations.nix.

# Quick hard reboot

```console
$ echo 1 > /proc/sys/kernel/sysrq; echo b > /proc/sysrq-trigger
```

# Reboot switch

If the host is no longer reachable, it is possible to remote reboot it from your raspberry pi:
Therefore first ssh to `doctor.thalheim.io`, then execute:

```console
$ reboot-servers --help
USAGE: /run/current-system/sw/bin/reboot-servers rose|martha|donna|amy|clara
# reboots rose
$ reboot-servers rose
```

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

# Installation

Make sure the system is booted into EFI:

```
[root@nixos:~]# mount | grep efivars
efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
```

## Partitioning

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
# Create a zpool for zfs
$ zpool create -f zroot /dev/nvme0n1p2
# Create zfs datasets: 
# - zroot/root/nixos for the /
# - zroot/root/tmp for /tmp
# - zroot/nixos/home for /home
# - zroot/reserved in case we run out-of-disk space (can be deleted in this case)
# - zroot/docker for docker
$ zfs create -o acltype=posixacl -o xattr=sa -o compression=lz4 -o mountpoint=none zroot/root
$ zfs create -o mountpoint=legacy -o setuid=off -o devices=off -o sync=disabled zroot/root/tmp
$ zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=true zroot/root/home
$ zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=true zroot/root/nixos
$ zfs create -o mountpoint=none -o refreservation=1G zroot/reserved
$ zfs create -o mountpoint=none -o compression=lz4 zroot/docker
# mount zfs root to /mnt
$ mount -t zfs zroot/root/nixos /mnt
# prepare mountpoints for home,tmp,boot
$ mkdir /mnt/{home,tmp,boot}
# mount boot partition
$ mount /dev/sda1 /mnt/boot/
# mount home partition
$ mount -t zfs zroot/root/home /mnt/home/
# mount temp partition
$ mount -t zfs zroot/root/tmp /mnt/tmp/
# fix permissions on tmp (important!)
$ chmod 777 /mnt/tmp
```

## Prepare NixOS configuration

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
$ cp clara.nix $newname.nix
# copy ssh keys from the installer to the new system (requires sshd service to be started)
# also share this public key (ssh_host_ed25519_key.pub) with @Mic92 to get a ssh certificate
$ cp /etc/ssh/ssh_host_* /mnt/etc/ssh
# the ssh certificate needs to go to modules/sshd/certs/$newname-cert.pub
# Than adjust configuration in $newname.nix
# Also add the new host in configurations.nix
# We primarly need a new tinc ip address for the vpn following https://github.com/Mic92/retiolum
# Also share in this step the key generated to /mnt/etc/tinc/retiolum
$ vim /mnt/etc/nixos/$newname.nix
# add ip address of the machine to
$ vim /mnt/etc/nixos/modules/hosts.nix
# Than run nixos-install
$ nix-shell -p nixFlakes -p git --run 'nixos-install --flake /mnt/etc/nixos#$newname'
```

# Backups

Lorenzo back ups with borgbackup to his [personal storage](https://www.ed.ac.uk/geosciences/intranet/it/data-storage/personal-storage)

They can be access from any host like this (secrets are in https://github.com/Mic92/doctor-cluster-secrets for access from other hosts):

```
$ sudo nix-shell -p borgbackup sshfs
[nix-shell:/etc/nixos]# mkdir -p /mnt/backup /tmp/borgbackup && sshfs -oIdentityFile=/etc/nixos/secrets/borgbackup-ssh-key -oPort=22222 s1443541@csce.datastore.ed.ac.uk:/csce/datastore/inf/users/s1443541 /mnt/backup && BORG_PASSPHRASE=$(cat /etc/nixos/secrets/borgbackup-password) borgfs /mnt/backup/borgbackup /tmp/borgbackup
[nix-shell:/etc/nixos]# ls -la /tmp/borgbackup
total 12
drwxr-xr-x  1 root root  0 Jul  7 17:00 .
drwxrwxrwt 20 root root 21 Jul  7 17:00 ..
drwxr-xr-x  1 root root  0 Jul  7 15:23 rose-all-homes-2020-07-07T15:23:39.failed
drwxr-xr-x  1 root root  0 Jul  7 16:49 rose-all-homes-2020-07-07T16:49:13
```

# Monitoring

Hosts are monitored here: https://grafana.thalheim.io/d/Y3JuredMz/monitoring?orgId=1
