We still have a few machines in Edinburgh

# Hosts

- [amy](amy.md)
- [clara](clara.md)
- [donna](donna.md)
- [rose](rose.md)
- [martha](martha.md)
- [sauron](sauron.md)
- [doctor](doctor.md)

# Reboot switch

Due to the lack of IPMI, we have a rasperry-pi based reboot switch
on the host doctor.thalheim.io.

If the host is no longer reachable, it is possible to remote reboot it from your raspberry pi:
Therefore first ssh to `doctor.thalheim.io`, then execute:

```console
$ reboot-servers --help
USAGE: /run/current-system/sw/bin/reboot-servers rose|martha|donna|amy|clara
# reboots rose
$ reboot-servers rose
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

# Networking

A graph of how the servers are connected right now can be found [here](https://github.com/TUM-DSE/doctor-cluster-config/blob/master/docs/edinburgh/graph.md).

## Sizes for transport to Munich
- Clara, Amy:          52x20x48
- Rose, Martha, Donna: 50x23x48 (15-20Kg)
- Grandalf:            37x25x21
- Sauron:              45x21x45
- Switch:              47x44x4
