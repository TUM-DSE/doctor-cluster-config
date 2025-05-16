{ config, lib, pkgs, ...}:
let
  kernelVersion = config.boot.kernelPackages.kernel.version;
in {
  boot.kernelPatches = [
    {
      name = "Added Configurations to Support VFIO";
      patch = null;
      extraStructuredConfig = with lib.kernel; {
        VFIO = lib.mkDefault yes;
        VFIO_IOMMU_TYPE1 = lib.mkDefault yes;
        VFIO_PLATFORM = lib.mkDefault yes;
        TEGRA_BPMP_GUEST_PROXY = lib.mkDefault no;
        TEGRA_BPMP_HOST_PROXY = lib.mkDefault no;
      };
    }
    {
      name = "Vfio_platform Reset Required False";
      patch = ./patches/0002-vfio_platform-reset-required-false.patch;
    }
    (
      if lib.versionAtLeast kernelVersion "6.6" then
        {
          name = "Add bpmp-virt modules";
          patch = ./patches/0001-Add-bpmp-virt-kernel-modules-for-kernel-6.6.patch;
        }
      else if lib.versions.majorMinor kernelVersion == "5.15" then
        {
          name = "Add bpmp-virt modules";
          patch = ./patches/0001-Add-bpmp-virt-kernel-modules-for-kernel-5.15.patch;
        }
      else
        null
    )
    {
      # This patch allows all BPMP (clocks, reset, and power) domains to be accessed
      # by the virtual machine. This is required if not all domains are defined in
      # the host device tree. After the passthrough is working, the required domains
      # should be defined in the host device tree and this patch should be commented.
      name = "Bpmp-host: allows all domains";
      patch = ./patches/0002-Bpmp-host-allows-all-domains.patch;
    }
    {
      name = "Bpmp virtualization host kernel configuration";
      patch = null;
      extraStructuredConfig = with lib.kernel; {
        VFIO_PLATFORM = yes;
        TEGRA_BPMP_HOST_PROXY = yes;
      };
    }
  ];



  # Enable hardware.deviceTree for handle host dtb overlays
  hardware.deviceTree.enable = true;

  hardware.deviceTree.overlays = [
    {
      name = "bpmp_host_overlay";
      dtsFile = ./bpmp_host_overlay.dts;
    }
  	{
	  name = "GPU/Display passthrough overlay to host DTB";
	  dtsFile = ./gpu_passthrough_overlay.dts;
 	}
  ];

  # TODO: Consider are these really needed, maybe add only in debug builds?
  environment.systemPackages =  [
    (pkgs.qemu_kvm.overrideAttrs (old: {
      # Patches from https://github.com/jpruiz84/qemu/tree/bpmp_for_v9.2
      patches = old.patches ++ [
        ./patches/0001-nvidia-bpmp-guest-driver-initial-commit.patch
        ./patches/0002-NOP_PREDEFINED_DTB_MEMORY.patch
        ./patches/0004-vfio-platform-Add-mmio-base-property-to-define-start.patch
      ];
    }))
    pkgs.dtc
  ];

  # Needed GPU VM passthru
  boot.kernelParams = [
    "vfio_iommu_type1.allow_unsafe_interrupts=1"
    "arm-smmu.disable_bypass=0"
  ];
}
