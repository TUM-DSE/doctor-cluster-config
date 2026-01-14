{ lib
, gcc13Stdenv
, fetchFromGitLab
, cmake
, ninja
, python3
, libxml2
, ncurses
}:

gcc13Stdenv.mkDerivation rec {
  pname = "clang-morello";
  version = "git-17f4965";

  src = fetchFromGitLab {
    domain = "git.morello-project.org";
    owner = "morello";
    repo = "llvm-project";
    rev = "17f4965c903e0dd94203dbb96ac5d5b931353108";
    sha256 = "sha256-KQGH1oTc4WnzCCA9tLfIiBMFIj/AQe1vrT+G8kNUTnc="; 
  };

  nativeBuildInputs = [ cmake ninja python3 ];
  buildInputs = [ libxml2 ncurses ];

  cmakeDir = "../llvm";

  cmakeFlags = [
    "-DLLVM_ENABLE_PROJECTS=clang;lld"
    "-DLLVM_TARGETS_TO_BUILD=AArch64"
    "-DLLVM_DEFAULT_TARGET_TRIPLE=aarch64-unknown-linux-musl_purecap"
    
    "-DCMAKE_BUILD_TYPE=Release"
    "-DLLVM_ENABLE_ASSERTIONS=ON"
    "-DLLVM_PARALLEL_LINK_JOBS=1"
    "-DLLVM_INSTALL_UTILS=ON"

    "-DCLANG_TOOLING_BUILD_AST_INTROSPECTION=OFF"
    "-DCLANG_ENABLE_STATIC_ANALYZER=OFF"
    "-DCLANG_ENABLE_ARCMT=OFF"
    
    # Silence warnings from newer GCC versions
    "-DCMAKE_CXX_FLAGS=-Wno-deprecated-declarations"
  ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "LLVM/Clang Cross-Compiler for Morello Purecap";
    homepage = "https://git.morello-project.org/morello/llvm-project";
    license = licenses.asl20;
    platforms = platforms.unix;
  };
}
