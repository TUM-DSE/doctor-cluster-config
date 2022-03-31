# NixOS direct connection with DHCP

You can include the [dnsmasq.nix](https://github.com/Mic92/dotfiles/blob/ddbb973b1243a3de35943d790f48dd0f0815d2d8/nixos/modules/dnsmasq.nix) module into your NixOS config.

Activate DHCP on some port:

```
sudo nmcli device set eth0 managed no
sudo ip l set eth0 master internal
journalctl -f -u dnsmasq
```

and deactivate it when connecting to another network again:

```
sudo ip link set eth0 nomaster
sudo nmcli device set eth0 managed yes
```
