{ lib, fetchFromGitLab, cmake, ninja, python3, pkg-config, zlib, clang, gcc, stdenv, ... }:
let
  cmakeFlags = [
    "-GNinja"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DLLVM_ENABLE_PROJECTS=clang;lld"
    "-DLLVM_TARGETS_TO_BUILD=ARM;AArch64"
    "-DCMAKE_INSTALL_PREFIX=$out"
    "-DLLVM_INSTALL_TOOLCHAIN_ONLY=ON"
    "-DLLVM_TOOL_LLVM_READOBJ_BUILD=ON"
  ];
in
stdenv.mkDerivation rec {
  pname = "llvm-morello";
  version = "dev";

  src = fetchFromGitLab {
    domain = "git.morello-project.org";
    owner = "morello";
    repo = "llvm-project";
    rev = "e9b4731a0896c74bfc31bd003c141193a748a3f2";
    sha256 = "sha256-ljI3HVc4xjxZhocaRqP5IKdOtdpjWA8lLQ0DcUCy9iE=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake ninja python3 pkg-config zlib clang gcc ];

  NIX_LDFLAGS = "-rpath ${zlib}/lib";

  configurePhase = ''
    mkdir -p build
    cd build
    cmake ${lib.concatMapStringsSep " " (x: "\"${x}\"") cmakeFlags} ../llvm
  '';

  buildPhase = ''
    ninja
  '';

  meta = with lib; {
    description = "LLVM from Morello's morello/dev branch";
    homepage = "https://git.morello-project.org/morello/llvm-project";
  };
}

