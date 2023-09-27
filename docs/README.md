# Accessing the server

There are several ways to access the servers:

- eduroam and LAN (All servers in TU munich are accessible from within the TUM network)
- Via SSH jump host: **recommended for ssh**
  - We have one Proxy jump host that contains all SSH keys that are added to the nixos configuration i.e. in modules/users.nix
  - Reproducible example: `SSH_AUTH_SOCK= ssh -v -F /dev/null -i <path/to/privkey> -oProxyCommand="ssh tunnel@login.dos.cit.tum.de -i <path/to/privkey> -W %h:%p" <yourusername>@graham.dos.cit.tum.de`
  - Keys are uploaded via the machine bill whenever nixos configuration is updated.
  - You can generate an SSH config file for all TUM hosts with [this script](./gen-ssh-config.sh), providing your username as an argument
- VPN provided by RBG: **recommended for admins**
  - this option only works for ls1 employes
  - this vpn also gives access to the management network (i.e. for IPMI access)
  - use the `dos` profile from [here](https://vpn.rbg.tum.de)
- VPN provided by LRZ:
  - Via eduvpn client [lrz eduvpn guide](https://doku.lrz.de/vpn-eduvpn-installation-und-konfiguration-11491448.html)
  - Or via OpenVPN client (certificate expires every few months) [tum.eduvpn.lrz.de](https://tum.eduvpn.lrz.de/vpn-user-portal/configurations)

All servers in TUM have public ipv6/ipv4 addresses and dns record following the format:

- `$hostname.dos.cit.tum.de` for the machine itself.
- `$hostname-mgmt.dos.cit.tum.de` for the IPMI/BMC interface.

i.e. bill has the addresses `bill.dos.cit.tum.de` and `bill-mgmt.dos.cit.tum.de`.

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
- dual NUMA node (EPYC 7413, for many expansion cards)
  - [amy](./hosts/amy.md)
  - [clara](./hosts/clara.md)
  - [rose](./hosts/rose.md)

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

**Note**: these servers are equipped with Persistent Memory (PM).
For information on how to setup the PM in App-Direct mode, please see [here](./SETUP_PM.md)

## Servers used for NFS/Services

- [bill](./hosts/bill.md)
- [nardole](./hosts/nardole.md)

## CI servers

Those serve as a github action runner for Systemprogramming + cloud systems lab

- [astrid](./hosts/astrid.md)
- [dan](./hosts/dan.md)
- [mickey](./hosts/mickey.md)

## ARM64

- [yasmin](./hosts/yasmin.md)
- We have an M1 Mac Mini in Patric's office with a dual boot macos/linux
  - when booted into NixOS/Linux: [donna](./hosts/donna.md)
  - when booted into macos: [sarah](./hosts/sarah.md)

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
  - doctor.r [doctor.nix](../hosts/doctor.nix): borg backup target
  - login.dos.cit.tum.de [README](../modules/jumphost/README.md): ssh jumphost and grafana
- RISC-V:
  - ruby.r [ruby.nix](./hosts/ruby.nix)

# Storage

We have a shared nfs-based `/home` mounted. The nfs for /home is based on a NVME
disk on nardole and is limited to 1TB. If you need fast local disk access use
`/scratch/$YOURUSER` - however unlike `/home` and `/share` this directory are
not included in the backup. If you want to share larger datasets between
machines use `/share`, which is based on two hard disk (15TB capacity).

Both nfs export stored on `nardole` are also replicated to `bill` every 15
minutes using zfs replication based on
[syncoid](https://github.com/TUM-DSE/doctor-cluster-config/blob/master/modules/nfs/server-backup.nix).
In case there are hardware problems with `nardole`, `bill` can take over serving
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

# Backups and snapshots

ZFS is used on all machines whenever possible. We enable automatic snapshots of
the filesystem every 15 minutes. The snapshot can be accessed by entering the
`.zfs` directory of a zfs dataset mountpoint.

- for NFS mounted directories, snapshots are on the NFS master node (nardole?, `/export/home/.zfs` or `/export/share/.zfs`)
- for local zfs datasets (`zfs list`) snapshots are at `/.zfs`, `/home/.zfs`, ...
- note that `.zfs` is not seen by `ls`

Furthermore `/share` and `/home` are backed up daily to get RBG storage using
[borgbackup](https://github.com/TUM-DSE/doctor-cluster-config/blob/master/modules/nfs/server.nix). See also [nixos borg wiki](https://nixos.wiki/wiki/Borg_backup#Mounting_point-in-time_archives).

```console
[root@nardole:/home/okelmann]# sudo su
[root@nardole:/home/okelmann]# eval $(ssh-agent)
[root@nardole:/home/okelmann]# ssh-add /run/secrets/tum-borgbackup-home-ssh
[root@nardole:/home/okelmann]# borg-job-eva-home list
nardole-eva-home-2022-12-28T00:00:00 Wed, 2022-12-28 00:00:05 [aca815ff996515a1b06c53e6363cff34fbdefaefda54b498fe1b579daeb97cff]
nardole-eva-home-2023-02-14T00:00:00 Tue, 2023-02-14 00:00:07 [5024321057e1da6b6664f88d1ab72340cc8a0d6c41e572cb24023bd73ba9f0d5]
nardole-eva-home-2023-02-15T00:00:00 Wed, 2023-02-15 00:00:07 [85aac6717e3f1835c7e4bb79e5d8dc9d2dde99db32e21851ada29b071e0f3aca]
[root@nardole:/home/okelmann]# borg-job-eva-home mount il1dsenixosbk@doctor.r:/mnt/backup/nfs-home::nardole-eva-home-2023-02-15T00:00:00
```

# Networking

Our chair currently has three networks:

- `il01`: for devices in the office
  - `ruby`: firewall port 22 open (only for `login` jumphost)
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
- L3 Switch "Craig" `craig-mgmt.dos.cit.tum.de` (sops encrypted (config)[./craig.sops])
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
