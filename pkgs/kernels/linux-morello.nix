{
  buildLinux,
  fetchFromGitLab,
  clang-morello,
  clang-morello-unwrapped,
  bintools-morello,
  runCommand,
  fetchurl,
  lib,
  openssl,
  elfutils,
  zlib,
  ...
}@args:
let

  rpath = runCommand "rpath" { } ''
    mkdir $out
    ln -s ${lib.getLib openssl}/lib/* $out
    ln -s ${lib.getLib elfutils}/lib/* $out
    ln -s ${lib.getLib zlib}/lib/* $out
  '';

  buildMorelloKernel =
    {
      domain,
      owner,
      repo,
      rev,
      sha256,
      version,
      modDirVersion,
      extraPatches ? [ ],
    }:
    buildLinux (
      args
      // rec {
        inherit version modDirVersion;

        src = fetchFromGitLab {
          inherit
            domain
            owner
            repo
            rev
            sha256
            ;
        };

        defconfig = "morello_pcuabi_defconfig";

        extraMakeFlags = [
          "LLVM=1"
          "LLVM_IAS=1"
          "CC=${clang-morello-unwrapped}/bin/clang"
          "LD=${clang-morello-unwrapped}/bin/ld.lld"
          "AR=${clang-morello-unwrapped}/bin/llvm-ar"
          "HOSTAR=${clang-morello-unwrapped}/bin/llvm-ar"
          "NM=${clang-morello-unwrapped}/bin/llvm-nm"
          "STRIP=${clang-morello-unwrapped}/bin/llvm-strip"
          "OBJCOPY=${clang-morello-unwrapped}/bin/llvm-objcopy"
          "OBJDUMP=${clang-morello-unwrapped}/bin/llvm-objdump"
          "READELF=${clang-morello-unwrapped}/bin/llvm-readelf"
          "HOSTLD=${bintools-morello}/bin/ld.lld"
          "HOSTCC=${clang-morello}/bin/clang"
          "HOSTCXX=${clang-morello}/bin/clang++"
          # openssl is not added to rpath of ./certs/extract-cert
          "HOSTLDFLAGS=-Wl,--rpath=${rpath}"
        ];

        ignoreConfigErrors = true;

        kernelPatches = [
          {
            name = "enable morello";
            patch = null;
            extraConfig = ''
              TCG_TPM m
              TCG_TIS m
              TCG_CRB m

              DMA_BUF_UDMABUF n
              DRM n
              DMA_BUF n
              DMA_SHARED_BUFFER n
              VIDEO_DEV n
              USERFAULTFD n
              XEN_BLKDEV_FRONTEND n
              XEN n
              XEN_PV n
              XEN_BACKEND n
              XEN_DEV_EVTCHN n
              UDF_FS n
              LIRC n
              RC_CORE n
              MEDIA_SUPPORT n

              USB_SERIAL n
              XDP_SOCKETS n
              SND_SOC_TI_UDMA_PCM n
              TI_K3_UDMA n
              UDMABUF n
              HID n
              HIDRAW n
              ANDROID n
              ANDROID_BINDER_IPC n

              CROS_EC_CHARDEV n
              CROS_EC n
              F2FS_FS n

              SHADOW_CALL_STACK n
            '';
          }
        ] ++ extraPatches;
        extraMeta.branch = version;
        autoModules = false;
      }
      // (args.argsOverride or { })
    );

  # https://git.morello-project.org/morello/kernel/linux
  # 1.8.1
  morello_1_8_1 = {
    domain = "git.morello-project.org";
    owner = "morello/kernel";
    repo = "linux";
    rev = "96c45a786534d894387e17ed60e4d31d33911567";
    sha256 = "sha256-HETq4ntekppJ6T6rGDzj9U0TlDdoy1oajIWfeZScoY0=";
    version = "6.7";
    modDirVersion = "6.7.0";
    extraPatches = [ ];
  };
in
# change here to change kernel
buildMorelloKernel morello_1_8_1
