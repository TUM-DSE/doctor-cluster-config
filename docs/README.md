# Accessing the server

There are several ways to access the servers:

- eduroam and LAN (All servers in TU munich are accessible from within the TUM network)
- Via SSH jump host: **recommended for ssh**, **required for students**
  - We have one Proxy jump host that contains all SSH keys that are added to the nixos configuration i.e. in modules/users.nix
  - Reproducible example: `SSH_AUTH_SOCK= ssh -v -F /dev/null -i <path/to/privkey> -oProxyCommand="ssh tunnel@login.dos.cit.tum.de -i <path/to/privkey> -W %h:%p" <yourusername>@graham.dos.cit.tum.de`
  - Keys are uploaded via the machine astrid whenever nixos configuration is updated.
  - You can generate an SSH config file for all TUM hosts with [this script](./gen-ssh-config.sh), providing your username as an argument
- VPN provided by RBG: **recommended for admins**
  - this option only works for ls1 employes
  - this vpn also gives access to the management network (i.e. for IPMI access)
  - use the `dos` profile from [here](https://vpn.rbg.tum.de)

All servers in TUM have public ipv6/ipv4 addresses and dns record following the format:

- `$hostname.dos.cit.tum.de` for the machine itself.
- `$hostname-mgmt.dos.cit.tum.de` for the IPMI/BMC interface.

i.e. astrid has the addresses `astrid.dos.cit.tum.de` and `astrid-mgmt.dos.cit.tum.de`.

# Accessing via xrdp

On servers where we import `xrdp.nix`, we have graphical access via xrdp. This is mainly useful for xilinx development.
User need to have `xrdpAccess` set to true in their account entry in [../modules/users](../modules/users).
After than run the following commands:

```
$ inv generate-password --user <USER>
```

Send the password in `<USER>-password` to the student
and store <USER>-password-hash in `./modules/users/xrdp-passwords.yml` by doing:

```
$ sops ./modules/users/xrdp-passwords.yml
```

You may have to restart xrdp-sesman.service for the changes to apply.

# Management Interfaces

Bios and the boot flow can be accessed/observed via "Remote Console" on the IPMI webinterfaces.

- use il1 VPN (see Accessing the server, only for staff)
- goto `https://$hostname-mgmt.dos.cit.tum.de`
- login credentials are encrypted in the doctor cluster repo `sops secrets.yaml`

To be able to accept self signed certificates in firefox: Go to the website `about:config` and set `network.stricttransportsecurity.preloadlist` to false.

# Hosts

- [Expansion cards and slots](./expansion_cards.md)
- [Network graph](./hosts/graph.md) (see also networking notes in "Expansion cards and slots")

## AMD-Epyc servers

Our epyc servers are shared devices on which many users usually work concurrently.

- single NUMA node (EPYC 7713P):
  - [graham](./hosts/graham.md)
  - [ryan](./hosts/ryan.md)
- single NUMA node (EPYC 9654P)
  - [irene](./hosts/irene.md)
- dual NUMA node (EPYC 9654), GPU
  - [jamie](./hosts/jamie.md)
- dual NUMA node (EPYC 7413, for many expansion cards)
  - [amy](./hosts/amy.md)
  - [clara](./hosts/clara.md)
  - [rose](./hosts/rose.md)
- dual NUMA node (AMD EPYC 9334)
  - [vislor](./hosts/vislor.md)

## Intel Xeon servers

Those servers (or individual devices) are sometimes used exclusively by a single user to conduct benchmarks.

- single socket Xeon Gold 5317
  - [jackson](./hosts/jackson.md)
  - [christina](./hosts/christina.md)
  - [adelaide](./hosts/adelaide.md)
  - [wilfred](./hosts/wilfred.md)
  - [river](./hosts/river.md)
- dual socket Xeon Gold 6326, GPU
  - [jack](./hosts/jack.md)
- dual socket Xeon Gold 6438Y+, CXL support
  - [xavier](./hosts/xavier.md)
- dual socket Xeon Platinum 8562Y+, TDX support
  - [ian](./hosts/ian.md)
- dual socket Xeon 6756E, TDX support
  - [martha](./hosts/martha.md)

**Note**: Some of these servers are equipped with Persistent Memory (PM).
For information on how to setup the PM in App-Direct mode, please see [here](./SETUP_PM.md)

## Servers used for NFS/Services


## CI servers

Those serve as a github action runner for Systemprogramming + cloud systems lab.
Astrid also hosts the buildbot master server with Graham as the buildbot worker.
See [buildbot.md](./buildbot.md) for documentation on how to add repositories and checks.

- [astrid](./hosts/astrid.md)
- [dan](./hosts/dan.md), nfs backup
- [mickey](./hosts/mickey.md), nfs primary


## Retired Server (names available for re-use)

- bill
- nardole

## ARM64

- [yasmin](./hosts/yasmin.md)
- [eliza](./hosts/eliza.md)
  - [Enabling MTE](./mte-supermicro.md)
- We have an M1 Mac Mini in Patric's office with a dual boot macos/linux
  - when booted into NixOS/Linux: [donna](./hosts/donna.md)
  - when booted into macos: [sarah](./hosts/sarah.md)

## RISC-V

- ruby.dos.cit.tum.de [ruby.nix](./hosts/ruby.nix), Hifive Unmatched
- tegan.dos.cit.tum.de [tegan.nix](./hosts/tegan.nix), Milk-V Pioneer

## Morello (ARM64)

Ace is currently running Debian. To add users, see [these instructions](./morello.md).

- [ace](./hosts/ace.md) (Morello)
  - For debugging, see [these instructions](./morello.md)
 
## NVIDIA Jetson (ARM64)

- [joy](./hosts/joy.md)

## FPGA-servers

Each of these machines is equipped with an Alveo U50 FPGA card. Those servers
are manually managed by [@atsushikoshiba](@atsushikoshiba). They run ubuntu -
that means that accounts/ssh keys added to this repos won't appear on those
machines. Those machines also are not backed up.

- [hinoki](./hosts/hinoki.md)
- [sakura](./hosts/sakura.md)
- momiji

## Others

- RBG VMs:
  - monitoring.dos.cit.tum.de (VM), doctor.r (container in VM) [doctor.nix](../hosts/doctor.nix): borg backup target, monitoring
    - [prometheus](https://prometheus.dse.in.tum.de)
    - [alertmanager](https://alertmanager.dse.in.tum.de)
    - [buildbot](https://buildbot.dse.in.tum.de)
  - login.dos.cit.tum.de [README](../modules/jumphost/README.md): ssh jumphost
  - dosvm1.cit.tum.de: pxeboot

# Storage

We have a shared nfs-based `/home` mounted. The nfs for /home is based on a NVME
disk on mickey and is limited to 1.5TB.
Please do not store large amounts of data such as VM images here. VM images of
running VMs will also interfere with the Backupsoftware.
Instead if you need fast local disk access use `/scratch/$YOURUSER`
- however unlike `/home` and `/share` this directory are
not included in the backup.
If you want to share larger datasets between
machines use `/share`, which is based on two hard disk (15TB capacity).

Both nfs export stored on `mickey` are also replicated to `dan` every 15
minutes using zfs replication based on
[syncoid](https://github.com/TUM-DSE/doctor-cluster-config/blob/master/modules/nfs/server-backup.nix).
In case there are hardware problems with `mickey`, `dan` can take over serving
the nfs.

## Adding non-nixos hosts to NFS.

Our nfs servers allows connections from the `2a09:80c0:102::/64` network.

Add the following line to `/etc/hosts`:

```
2a09:80c0:102::f000:0 nfs
```

And the following lines to `/etc/fstab` to mount a shared `/home` and `/share`

```
nfs:/export/home /home nfs4 nofail,timeo=14 0 2
nfs:/export/share /share nfs4 nofail,timeo=14 0 2
```

## Check disk usage
On NFS server (`mickey`), run

```
$ zpool list
NAME       SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOT
nfs-data  14.5T  4.23T  10.3T        -         -     0%    29%  1.00x    ONLINE  -
nfs-home  3.48T  3.38T   110G        -         -    49%    96%  1.00x    ONLINE  -
zroot     1.45T   152G  1.30T        -         -    12%    10%  1.00x    ONLINE  -
```

To get the disk usage per user, run

```
sudo nix run nixpkgs#ncdu -- /export/home
```

# Backups and snapshots

ZFS is used on all machines whenever possible. We enable automatic snapshots of
the filesystem every 15 minutes. The snapshot can be accessed by entering the
`.zfs` directory of a zfs dataset mountpoint.

- for NFS mounted directories, snapshots are on the NFS master node (mickey, `/export/home/.zfs` or `/export/share/.zfs`)
- for local zfs datasets (`zfs list`) snapshots are at `/.zfs`, `/home/.zfs`, ...
- note that `.zfs` is not seen by `ls`

Furthermore `/share` and `/home` are backed up daily to get RBG storage using
[borgbackup](https://github.com/TUM-DSE/doctor-cluster-config/blob/master/modules/nfs/server.nix). See also [nixos borg wiki](https://nixos.wiki/wiki/Borg_backup#Mounting_point-in-time_archives).

```console
[root@mickey:~]# eval $(ssh-agent)
[root@mickey:~]# ssh-add /run/secrets/tum-borgbackup-home-ssh
[root@mickey:~]# borg-job-nfs-home list
```

## Delete snapshots
ZFS taking snapshots means that deleting files does not immediately free up
space. To reclaim space immediately, you have to delete the snapshots.

To check which snapshots takes up the most space, (on the NFS server)

```
$ zfs list -t snapshot | sort -k2 -rh | head
nfs-home/home@syncoid_mickey_2025-07-29:10:45:02-GMT00:00   72.7G      -  1.85T  -
nfs-home/home@syncoid_mickey_2025-07-15:08:45:02-GMT00:00   18.5G      -  1.54T  -
nfs-home/home@syncoid_mickey_2025-07-03:13:15:01-GMT00:00   17.0G      -  1.45T  -
nfs-home/home@syncoid_mickey_2025-07-07:11:00:01-GMT00:00   16.2G      -  1.47T  -
nfs-home/home@syncoid_mickey_2025-07-04:12:15:01-GMT00:00   16.2G      -  1.47T  -
nfs-home/home@syncoid_mickey_2025-07-01:12:00:01-GMT00:00   16.2G      -  1.44T  -
nfs-home/home@syncoid_mickey_2025-07-08:11:00:01-GMT00:00   16.1G      -  1.51T  -
nfs-home/home@syncoid_mickey_2025-07-08:08:45:01-GMT00:00   16.1G      -  1.51T  -
nfs-home/home@syncoid_mickey_2025-07-03:11:00:01-GMT00:00   16.1G      -  1.45T  -
nfs-home/home@syncoid_mickey_2025-07-01:11:45:01-GMT00:00   16.1G      -  1.44T  -
```

The snapshot files might be shared between multiple snapshots. To check actual
size that we can reclaim by deleting a snapshot, run the following command
(*`-nv` means "dry run"*):

```
$ zfs destroy -nv nfs-home/home@syncoid_mickey_2025-07-29:10:45:02-GMT00:00
would destroy nfs-home/home@syncoid_mickey_2025-07-29:10:45:02-GMT00:00
would reclaim 72.7G
```

If this is ok, then run the command without `-nv` to actually delete the snapshot:

```
$ sudo zfs destroy nfs-home/home@syncoid_mickey_2025-07-29:09:00:02-GMT00:00
```

`zfs destory nfs-home/home` (without snapshot name) will delete the entire file
system, so be careful!

*IMPORTANT*: Do not delete the latest snapshots, as which are being synced with `dan`.
It would be safer to delete old ones.  You can check the synchronization
status with the following command:

```
[root@mickey:~]# systemctl status syncoid-nfs-home-home
```

# Networking

Our chair currently has three networks:

- `il01`: for devices in the office
  - `ruby`: firewall port 22 open (only for `login` jumphost)
  - `ace`: firewall port 22 open from anywhere
  - `joy`: firewall port 22 open from anywhere
- `il01_16`: for the servers
  - open to `il01` (and VPN)
  - usually 10Gbit/s SFP+ connectors for fiber
  - ipv4: 131.159.102.0/24
  - ipv6: 2a09:80c0:102::/64
- `il01_15` for management
  - open only to il01 VPN provided by RBG
  - usually 1Gbit/s RJ-45
  - ipv4: 172.24.90.0/24
- `il01_14` for internal connections
  - closed, internal network, private ips
  - ipv4: 172.24.89.0/24
- LRZs eduvpn: 
  - open to Münchner Wissenschaftsnetz
  - ipv4: 10.0.0.0/8
  - Via eduvpn client [lrz eduvpn guide](https://doku.lrz.de/vpn-eduvpn-installation-und-konfiguration-11491448.html)
  - Or via OpenVPN client (certificate expires every few months) [tum.eduvpn.lrz.de](https://tum.eduvpn.lrz.de/vpn-user-portal/configurations)
- TUM-ITO dosvpn: 
  - may access:
    - 131.159.0.0/16
    - 192.187.0.0/16
    - 10.0.0.0/8
    - 172.24.0.0/17
  - ipv4: 172.24.238.0(/24 maybe?)
- LRZ: 192.187.0.0/16
- TUM-ITO/RBG: 131.159.0.0/16
- TUM-ITO/RBG private: 172.24.0.0/16
- TUM-ITO/RBG vlans: 172.24.0.0/17
- L3 Switch "Adric" `adric-mgmt.dos.cit.tum.de`
  - see [adric.md](./adric.md)
  - FibreStore N8550-32C switch with Broadcom BCM56870 Trident III chip
  - 32x 100G QSFP
  - 2x 10G SFP+
  - 8 core Intel Xeon D-1518 @ 2.20GHz
  - subnet: 10.0.0.0/24
  - management via ssh with username admin 
- Retired: L3 Switch "Craig" `craig-mgmt.dos.cit.tum.de` (sops encrypted (config)[./craig.sops])
  - 6x 100Gbit/s QSFP
  - many 10Gbit/s SFP+
  - ip: 172.24.90.18
  - vlan example config (layer2->static vlan config)
    - vlan id: 1; untagged ports: Fx0/1-48,Cx0/1-2,Cx0/4; forbidden ports: Cx0/3,Cx0/5;
    - vlan id: 2; vlan name: vlan2; untagged ports: Cx0/3,Cx0/5; forbidden ports: Fx0/1-48,Cx0/1-2,Cx0/4;

To add a new machine send the MAC address of your host interface and your IPMI/management interface to `ls1.admin@in.tum.de`.
If the RGB group asks which networks to connect your machine to, tell them `il01_16` for the machine and `il01_15` for IPMI/BMC.

A graph of how the servers are connected right now can be found [here](./hosts/graph.md).

## Names left to pick

-
