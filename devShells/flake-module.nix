{
  perSystem = { inputs', self', pkgs, system, ... }: {
    devShells.default = pkgs.mkShellNoCC {
      buildInputs = [
        pkgs.ipmitool

        pkgs.nixos-rebuild
        pkgs.python3.pkgs.invoke
        pkgs.nixos-anywhere
        pkgs.python3.pkgs.deploykit
        pkgs.mypy
        pkgs.dnsmasq
        pkgs.python3.pkgs.netaddr
        pkgs.openssh
        pkgs.gitMinimal # for git flakes
        pkgs.rsync
        pkgs.nixVersions.latest
        pkgs.coreutils
        pkgs.curl # when uploading tarballs
        pkgs.gnugrep
        pkgs.findutils
        pkgs.gnused # needed by ssh-copy-id
        # sops dependencies
        pkgs.age
        pkgs.sops
        pkgs.yq-go
        pkgs.cpio
      ] ++ pkgs.lib.optional (pkgs.stdenv.isLinux) pkgs.mkpasswd;
    };
  };
}
