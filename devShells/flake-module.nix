{
  perSystem = { inputs', self', pkgs, system, ... }: {
    devShells.default = pkgs.mkShellNoCC {
      buildInputs = [
        pkgs.ipmitool

        pkgs.nixos-rebuild
        pkgs.python3.pkgs.invoke
        #Until nixos-anywhere is packaged
        inputs'.nixos-anywhere.packages.nixos-anywhere-pxe
        pkgs.python3.pkgs.deploykit
        pkgs.mypy
        pkgs.pixiecore
        pkgs.dnsmasq
        pkgs.python3.pkgs.netaddr
        pkgs.qemu_kvm
        pkgs.openssh
        pkgs.gitMinimal # for git flakes
        pkgs.rsync
        pkgs.nix
        pkgs.coreutils
        pkgs.curl # when uploading tarballs
        pkgs.gnugrep
        pkgs.findutils
        pkgs.gnused # needed by ssh-copy-id
        # sops dependencies
        pkgs.age
        pkgs.sops
        pkgs.yq-go
      ] ++ pkgs.lib.optional (pkgs.stdenv.isLinux) pkgs.mkpasswd;
    };
  };
}
