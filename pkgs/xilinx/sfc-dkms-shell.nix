with import <nixpkgs> {};
let
  kernel = linuxPackages.kernel;
in stdenv.mkDerivation {
  name = "env";
  buildInputs = linux.moduleBuildDependencies;
  KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  hardeningDisable=["all"];
}
