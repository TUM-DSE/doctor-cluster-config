# Add a new host

```console
$ cp donna.nix $host
$ ln -s $host host-configuration.nix
```

# Quick hard reboot

```console
$ echo 1 > /proc/sys/kernel/sysrq; echo b > /proc/sysrq-trigger
```
