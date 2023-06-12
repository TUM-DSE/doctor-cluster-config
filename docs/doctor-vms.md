# doctor-VMs

We can host VMs. See `VMs` in (doctor-vms.nix)[/modules/doctor-VMs.nix].

Assuming VM name `qemu1`:

- Fully exposed in our VPN at qemu1.dos.cit.tum.de
- System service: `systemctl status doctor-vm-qemu1`
- Script to start manually: `doctor-vm-qemu1`
- Disk images specified in `doctor-VMs.nix`

Example to prepare Ubuntu image:

```bash
# dont place qemu images in /home (nfs) but on /scratch!
cd /scratch/doctor-VMs
# download qemu image
sudo curl -O https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img
# qcow2 is more space efficient
sudo qemu-img convert -O qcow2 jammy-server-cloudimg-amd64-disk-kvm.img new.qcow2
sudo qemu-img resize new.qcow2 +50G
# prepare cloud-init config for first ubuntu start:
cloud-localds user-data.img user-data
```

Insecure example for `./user-data`:

```
#cloud-config
# default username: ubuntu
password: ubuntu
chpasswd: { expire: False }
ssh_pwauth: True
```

# Notes for doing the same with containers:

- `docker run --mac-address=*`
- but docker really does not want to use bridges managed by the host OS
- ubuntu lxc images https://us.lxd.images.canonical.com/
- use host bridge with lxc container (lxc.net.0.{type, link, hwaddr}): https://wiki.archlinux.org/title/Linux_Containers#Host_network_configuration
