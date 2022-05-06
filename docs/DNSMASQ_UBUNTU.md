# Ubuntu direct connection with DHCP

On Ubuntu you have to set up a network bridge (here named *internal*) using `systemd-networkd` and `brctl`.
More specifically, create the following files ([source](https://major.io/2015/03/26/creating-a-bridge-for-virtual-machines-using-systemd-networkd/)):
```
❯ cat /etc/systemd/network/internal.netdev
[NetDev]
Name=internal
Kind=bridge

❯ cat /etc/systemd/network/uplink.network
[Match]
Name=eth0
[Network]
Bridge=internal

❯ cat /etc/systemd/network/internal.network
[Match]
Name=internal
[Network]
Address=192.168.32.50/24
LLMNR=true
LLDP=true
```
Start systemd-neworkd with `systemctl start systemd-networkd`.
Check the created bridge with `brctl show`.
After you make sure your bridge is set up successfully `sudo ip l set eth0 master internal`.
Install `dnsmasq` and append the extra config from `dnsmasq.nix` into `/etc/dnsmasq.conf`:
```
interface=internal
#interface=virttap
listen-address=127.0.0.1
dhcp-range=192.168.32.50,192.168.32.100,12h
# disable dns
port=0
```
and then restart the dnsmasq service with `sudo systemctl restart dnsmasq.service`.
`journalctl -f -u dnsmasq` will give you the IP address of the server.