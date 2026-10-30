# Rockchip BSP kernel for the RK3588 (clockwork, Orange Pi 5 Ultra), as
# maintained by Armbian. Mainline only has the `rocket` NPU driver, which
# the vendor userspace (librknnrt, RKLLM, rknn-toolkit2) cannot use; this
# tree carries Rockchip's own `rknpu` 0.9.8 driver, exposed as a DRM render
# node that librknnrt finds by itself.
#
# linux-rk35xx-vendor.config is Armbian's defconfig for this tree, taken
# from armbian/build@98692adee6442f6f221200cf8e6642f9c6a7b740
# (config/kernel/linux-rk35xx-vendor.config).
{
  lib,
  fetchFromGitHub,
  applyPatches,
  buildLinux,
  gcc13Stdenv,
  ...
}@args:
let
  version = "6.1.172";
in
buildLinux (
  args
  // {
    inherit version;
    modDirVersion = version;
    extraMeta.branch = "6.1";

    # Predates GCC 14/15: C23-by-default breaks the build.
    stdenv = gcc13Stdenv;

    src = applyPatches {
      name = "linux-rockchip-rk-6.1-rkr7.2";
      src = fetchFromGitHub {
        owner = "armbian";
        repo = "linux-rockchip";
        rev = "85233a85b67928000afc2e966bab86a8c414f1b4"; # branch rk-6.1-rkr7.2
        hash = "sha256-66758y8xChgCE8TPY6GsLRMpW+J19I5yqJ/0REocSpo=";
      };
      postPatch = ''
        cp ${./linux-rk35xx-vendor.config} arch/arm64/configs/armbian_defconfig
      '';
    };
    defconfig = "armbian_defconfig";

    enableCommonConfig = false;
    autoModules = false;
    ignoreConfigErrors = true;

    structuredExtraConfig = with lib.kernel; {
      WERROR = no;

      ROCKCHIP_RKNPU = yes;
      ROCKCHIP_RKNPU_DRM_GEM = yes;

      DEVTMPFS = yes;
      CGROUPS = yes;
      INOTIFY_USER = yes;
      SIGNALFD = yes;
      TIMERFD = yes;
      EPOLL = yes;
      FHANDLE = yes;
      DMIID = yes;
      AUTOFS_FS = yes;
      TMPFS_POSIX_ACL = yes;
      TMPFS_XATTR = yes;
      SECCOMP = yes;
      CRYPTO_USER_API_HASH = yes;
      CRYPTO_HMAC = yes;
      CRYPTO_SHA256 = yes;
      BLK_DEV_INITRD = yes;
      MODULES = yes;
    };
  }
  // (args.argsOverride or { })
)
