# Accessing the server

All servers in TU munich are accessible from within the TUM network i.e. eduroam and LAN.

Furthermore ls1 employes can use the il1 profile from
[here](https://vpn.rbg.tum.de). This vpn also gives access to the management
network. Students of the university can use the [lrz
openvpn](https://doku.lrz.de/display/PUBLIC/VPN+-+OpenVPN+Testbetrieb) to access
the servers.

All servers in TUM have public ipv6/ipv4 addresses and dns record following the format:

- `$hostname.dse.inf.tum.de` for the machine itself.
- `$hostname-mgmt.dse.in.tum.de` for the IPMI/BMC interface.

i.e. bill has the addresses `bill.dse.inf.tum.de` and `bill-mgmt.dse.inf.tum.de`.

# Hosts

## AMD-Epyc servers

- [graham](graham.md)
- [ryan](ryan.md) (currently used for Swiss-knife course)

## Servers used for NFS/Services

- [bill](bill.md)
- [nardole](nardole.md)

# CI servers

Those serve as a github action runner for Systemprogramming + cloud systems lab
TODO: generate report with inxi

- [astrid](astrid.md)
- [dan](dan.md)
- [mickey](mickey.md)

## ARM64

- [yasmin](yasmin.md)

## FPGA-servers

Those servers are manually managed by @atsushikoshiba.
They run ubuntu, hence accounts/ssh keys added to this repos won't appear on those
machines.

- hinoki
- sakura

## Names left to pick

- sarah
- jackson
- christina
- adelaide
- wilfred
- river
- craig
- jack
