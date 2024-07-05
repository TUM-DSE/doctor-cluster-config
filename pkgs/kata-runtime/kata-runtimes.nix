{ stdenv, lib, kata-runtime, autoPatchelfHook }:
let version = "3.6.0";
in stdenv.mkDerivation rec {
  pname = "kata-runtimes";
  version = "3.6.0";

  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ ];

  buildPhase = ''
    mkdir bin
    printf "#!/usr/bin/env bash\nKATA_CONF_FILE=/etc/kata-containers/configuration-fc.toml ${kata-runtime}/bin/containerd-shim-kata-v2 \$@" > bin/containerd-shim-kata-fc-v2 
    printf "#!/usr/bin/env bash\nKATA_CONF_FILE=/etc/kata-containers/configuration-qemu.toml ${kata-runtime}/bin/containerd-shim-kata-v2 \$@" > bin/containerd-shim-kata-qemu-v2
    printf "#!/usr/bin/env bash\nKATA_CONF_FILE=/etc/kata-containers/configuration-snp.toml ${kata-runtime}/bin/containerd-shim-kata-v2 \$@" > bin/containerd-shim-kata-snp-v2
    chmod +x bin/*


  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -r bin/* $out/bin/
    runHook postInstall
  '';

}
