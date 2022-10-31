# Accessing the server

There are several ways to access the servers:

- eduroam and LAN (All servers in TU munich are accessible from within the TUM network)
- VPN provided by RBG:
  - this option only works for ls1 employes
  - this vpn also gives access to the management network (i.e. for IPMI access)
  - use the il1 profile from [here](https://vpn.rbg.tum.de)
- VPN provided by LRZ:
  - This vpn is also accessible by students, see this [link](https://doku.lrz.de/display/PUBLIC/VPN+-+OpenVPN+Testbetrieb)
- Via SSH jump host:
  - We have one Proxy jump host that contains all SSH keys that are added to the nixos configuration i.e. in modules/users.nix
  - Reproducible example: `SSH_AUTH_SOCK= ssh -v -F /dev/null -i <path/to/privkey> -oProxyCommand="ssh tunnel@login.dse.in.tum.de -i <path/to/privkey> -W %h:%p" <yourusername>@graham.dse.in.tum.de`
  - Keys are uploaded via the machine bill whenever nixos configuration is updated.
  - You can generate an SSH config file for all TUM hosts with [this script](../gen-tum-ssh-config.sh), providing your username as an argument

All servers in TUM have public ipv6/ipv4 addresses and dns record following the format:

- `$hostname.dse.in.tum.de` for the machine itself.
- `$hostname-mgmt.dse.in.tum.de` for the IPMI/BMC interface.

i.e. bill has the addresses `bill.dse.in.tum.de` and `bill-mgmt.dse.in.tum.de`.

# Hosts

- [Expansion cards and slots](expansion_cards.md)
- [Network graph](graph.md) (see also networking notes in "Expansion cards and slots")


## AMD-Epyc servers

Our epyc servers are shared devices on which many users usually work concurrently.

- [graham](graham.md)
- [ryan](ryan.md)

## Intel Xeon servers

Those servers (or individual devices) are sometimes used exclusively by a single user to conduct benchmarks. 

- single socket Xeon Gold 5317  
  - [jackson](jackson.md)
  - [christina](christina.md)
  - [adelaide](adelaide.md)
  - [wilfred](wilfred.md)
  - [river](river.md)
- dual socket Xeon Gold 6326, GPU
  - [jack](jack.md)

**Note**: these servers are equipped with Persistent Memory (PM). 
For information on how to setup the PM in App-Direct mode, please see [here](../SETUP_PM.md)

## Servers used for NFS/Services

- [bill](bill.md)
- [nardole](nardole.md)

# CI servers

Those serve as a github action runner for Systemprogramming + cloud systems lab

- [astrid](astrid.md)
- [dan](dan.md)
- [mickey](mickey.md)


## ARM64

- [yasmin](yasmin.md)
- [sarah](sarah.md): M1 Mac Mini, no ipmi, in Redha's office, accounts are created manually

## FPGA-servers

Each of these machines is equipped with an Alveo U50 FPGA card.  Those servers
are manually managed by [@atsushikoshiba](@atsushikoshiba). They run ubuntu -
that means that accounts/ssh keys added to this repos won't appear on those
machines.  Those machines also are not backed up.

- [hinoki](hinoki.md)
- sakura

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
[borgbackup](https://github.com/TUM-DSE/doctor-cluster-config/blob/master/modules/nfs/server.nix)

# Networking

Our chair currently has three networks:

- `il01_16` for the machines:
  - order 10Gbit/s SFP+ connectors for fiber!
  - ipv4: 131.159.102.0/24
  - ipv6: 2a09:80c0:102::/64
- `il01_15` for management
  - usually 1Gbit/s RJ-45
  - ipv4: 172.24.90.0/24
- L3 Switch "Craig" `craig-mgmt.dse.in.tum.de`
  - 6x 100Gbit/s QSFP
  - many 10Gbit/s SFP+
  - ip: to be configured

To add a new machine send the MAC address of your host interface and your IPMI/management interface to `ls1.admin@in.tum.de`.
If the RGB group asks which networks to connect your machine to, tell them `il01_16` for the machine and `il01_15` for IPMI/BMC.

A graph of how the servers are connected right now can be found [here](graph.md).

## Names left to pick

- amy
- bill
- clara
- doctor
- donna
- martha
- rose
