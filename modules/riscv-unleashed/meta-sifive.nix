# SiFive's patches

{ fetchFromGitHub }:
let
  metaSifive = fetchFromGitHub {
    owner = "sifive";
    repo = "meta-sifive";
    rev = "1dd1d1e9896e80f6418b981c57b83c2de76046cb"; # 2022.12
    sha256 = "sha256-RvycCbrBaO+VPxEm5OJEEMw9B5WYmBrpj91OUN0rQWw=";
  };
in
{
  kernelPatches = map (patch: "${metaSifive}/recipes-kernel/linux/files/${patch}") [
    # Do we need this patch?
    "Revert-riscv-dts-sifive-unmatched-Link-the-tmp451-wi.patch"
  ];
}
