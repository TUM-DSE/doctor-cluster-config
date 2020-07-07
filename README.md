# Update all servers

1. Log into rose
2. Change to `/etc/nixos`, do the configuration changes & run `git push`
3. Run `./update-all.sh` to deploy to all servers

# Add a new host

```console
$ cp donna.nix $host
$ ln -s $host host-configuration.nix
```

# Quick hard reboot

```console
$ echo 1 > /proc/sys/kernel/sysrq; echo b > /proc/sysrq-trigger
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
