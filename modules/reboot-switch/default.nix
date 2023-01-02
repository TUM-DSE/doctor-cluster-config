{ pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "reboot-servers";
      dontUnpack = true;
      installPhase = ''
        install -D -m755 ${./reboot-servers} $out/bin/reboot-servers
      '';
    })
  ];
}
