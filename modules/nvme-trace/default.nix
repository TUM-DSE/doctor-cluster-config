{ lib, ... }:
{
  boot.kernelPatches = [
    {
      name = "nvme-trace";
      patch = ./patches/0001-nvme-add-infrastructure-for-full-SQ-CQ-tracing.patch;
    }
  ];
}
