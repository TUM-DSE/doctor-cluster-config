The documenation for all hosts lives in [here](docs/hosts). 
The corresponding nixos configuration is in [./hosts](./hosts). 

# New admins: getting started

1. Install [nix](https://nixos.org/download.html#download-nix) (the recommended Multi-user installation is not NixOS, but only a package manager)
2. [Enable flake support in nix](https://nixos.wiki/wiki/Flakes#Permanent). This effectively adds the following flags to all your `nix <flags> develop`-like commands: `--extra-experimental-features nix-command --extra-experimental-features flakes`
3. Clone the `doctor-cluster-config` repo, `cd` into it and run: `nix develop`. This opens a shell with additional packages available such as `inv --list`, `sops` and `age`.
4. To generate new admin key, run (requires [age](https://github.com/FiloSottile/age)):
```
mkdir -p ~/.config/sops/age/
age-keygen -o ~/.config/sops/age/keys.txt
```
Provide the generated key to a pre-existing admin and wait for him to re-encrypt all secrets in this repo with it. After pulling the re-encrypted secrets you can read them with `sops secrets.yml`.


# Apply config to all servers

Choose a deployment target:


``` console
$ inv -l
Available tasks:

  cleanup-gcroots
  deploy                   Deploy to servers
  deploy-host              Deploy to a single host, i.e. inv deploy-host --host 192.168.1.2
  deploy-local             Deploy NixOS configuration on the same machine. The NixOS configuration is
  format-disks             Format disks with zfs, i.e.: inv format-disks --hosts new-hostname --disk /dev/nvme0n1
  generate-root-password   Generate password hashes for users i.e. for root in ./hosts/$HOSTNAME.yml
  generate-ssh-cert        Generate ssh cert for host, i.e. inv generate-ssh-cert bill 131.159.102.1
  install-nixos            install nixos, i.e.: inv install-nixos --hosts new-hostname --flakeattr
  ipmi-powercycle
  ipmi-serial
  mount-disks              Mount disks from the installer, i.e.: inv mount-disks --hosts new-hostname --disk /dev/nvme0n1
  print-age-key            Print age key for sops, inv print-age-key --hosts "host1,host2"
  print-tinc-key
  reboot                   Reboot hosts. example usage: fab --hosts clara.r,donna.r reboot
  update-docs              Regenerate docs for all servers
  update-lldp-info         Regenerate lldp info for all servers
  update-sops-files        Update all sops yaml and json files according to .sops.yaml rules
```

Run!

``` console
$ inv deploy
```

# Add new users

Add chair members to [./modules/chair-members.nix](./modules/users/chair-members.nix) and students to [./modules/users/students.nix](./modules/users/students.nix).

For chair members use a uid in the 1000-2000. For new students use a uid in the
2000-3000 range. Check that the uid is unique across both files and in the
range between to avoid conflicts.

If you need to give reviewers access i.e. for artifact evaluation, add them to
[./modules/users/reviewers.nix](./modules/users/reviewers.nix).  We use the
uid range 4000-5000 there. By using `users.users.<username>.allowedHosts` it's
possible to limit the hosts these users can access. To access the machine, they
can use the ssh tunnel as described in
[here](./docs/hosts#accessing-the-server).

# Add new servers

For installing new servers, see [Add servers](docs/ADD_SERVER.md).

# Update system

We use [flakes](https://nixos.wiki/wiki/Flakes) to manage 
nixpkgs versions. To upgrade use:

``` console
$ nix flake update
```

Than commit `flake.lock`.

# Home-manager

To install home-manager for a user simply run:

``` console
$ nix-shell '<home-manager>' -A install
```

This will initiate your home-manager and will generate a file similar to the one in ```home/.config/nixpkgs/home.nix```

# Visual Studio Code Server support in NixOS

You can use [this](https://github.com/msteen/nixos-vscode-server) to enable support for VS Code Server in NixOS.

An example of the ```home.nix``` configured for VS Code support is shown in ```home/.config/nixpkgs/home.nix```.


# IPMI

On our TUM rack machines we have IPMI support.

Generally, you can find the IPMI web interface at
`https://$HOST-mgmt.dse.in.tum.de/` (i.e. https://bill-mgmt.dse.in.tum.de)
once the device has been installed in the rack.  These addresses are only
available through the management network, so you must use the [RBG
vpn](https://vpn.rbg.tum.de/) for il1 to access them.

You can also retrieve the IP addresses assigned to the IPMI/BMC firmware by
running:

```console
$ ipmitool lan print
```

on the machine. On the other host (i.e. your laptop) you can run the following command to get a serial console:

```console
$ inv impi-serial --host <ipmi-ip-address>
```

The following will reboot the machine:

```console
$ inv impi-powercycle --host <ipmi-ip-address>
```

To boot the a machine into bios, use:

```console
$ inv ipmi-boot-bios --host <ipmi-ip-address>
```

The IPMI password here is encrypted with
[sops](https://github.com/mozilla/sops). To decrypt it on your machine, your
age/pgp fingerprint must be added to `.sops.yaml` in this repository. And one of
the existing users must re-encrypt `secrets.yml` with your key. 

Then press enter to get a login prompt. The root password for all machines is
also stored in [secrets.yaml]().

# Monitoring

Hosts are monitored here: https://grafana.thalheim.io/d/Y3JuredMz/monitoring?orgId=1

# CI

All machines are build by [gitlab ci](https://gitlab.com/TUM-DSE/doctor-cluster-config/-/pipelines) on a
self-hosted runner. Gitlab will also propagate the build status to the github repository eventually. 
The resulting builds are uploaded to https://tum-dse.cachix.org from where
machines can download them while upgrading.

