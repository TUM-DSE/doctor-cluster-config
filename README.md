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
