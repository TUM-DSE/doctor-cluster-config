{ lib
, stdenv
, fetchFromGitLab
, cmake
, ninja
, python3
, clang-morello
, musl-morello-purecap
, linux-morello-headers
}:

stdenv.mkDerivation rec {
  pname = "llvm-morello-purecap";
  version = "git-17f4965";

  src = fetchFromGitLab {
    domain = "git.morello-project.org";
    owner = "morello";
    repo = "llvm-project";
    rev = "17f4965c903e0dd94203dbb96ac5d5b931353108";
    sha256 = "sha256-KQGH1oTc4WnzCCA9tLfIiBMFIj/AQe1vrT+G8kNUTnc="; 
  };

  nativeBuildInputs = [ cmake ninja python3 clang-morello ];

  cmakeDir = "../runtimes";

  CC_PATH = "${clang-morello}/bin/clang";
  CXX_PATH = "${clang-morello}/bin/clang++";
  SYSROOT_PATH = "${musl-morello-purecap}";
  HEADER_PATH = "${linux-morello-headers}/include";

  preConfigure = ''
    # Define the Flags string
    export FLAGS="-march=morello -mabi=purecap --target=aarch64-linux-musl_purecap --sysroot=$SYSROOT_PATH -I$HEADER_PATH -funwind-tables -fexceptions"

    # Export them so CMake picks them up automatically
    export CFLAGS="$FLAGS"
    export CXXFLAGS="$FLAGS"
    export ASMFLAGS="$FLAGS"

    # Ensure CMake knows which compiler to use
    export CC=$CC_PATH
    export CXX=$CXX_PATH
  '';

  cmakeFlags = [
    "-DLLVM_ENABLE_RUNTIMES=libcxx;libcxxabi;libunwind;compiler-rt"
    
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_C_COMPILER=${clang-morello}/bin/clang"
    "-DCMAKE_CXX_COMPILER=${clang-morello}/bin/clang++"
    "-DCMAKE_ASM_COMPILER=${clang-morello}/bin/clang"
    
    "-DCMAKE_C_COMPILER_WORKS=ON"
    "-DCMAKE_CXX_COMPILER_WORKS=ON"
    "-DCMAKE_ASM_COMPILER_WORKS=ON"
    "-DCMAKE_C_COMPILER_TARGET=aarch64-linux-musl_purecap"
    "-DCMAKE_CXX_COMPILER_TARGET=aarch64-linux-musl_purecap"
    "-DCMAKE_ASM_COMPILER_TARGET=aarch64-linux-musl_purecap"
    
    "-DLLVM_CONFIG_PATH=${clang-morello}/bin/llvm-config"
    
    "-DLIBCXX_HAS_MUSL_LIBC=ON"
    "-DLIBCXX_ENABLE_SHARED=OFF"
    "-DLIBCXX_ENABLE_STATIC=ON"
    "-DLIBCXXABI_ENABLE_SHARED=OFF"
    "-DLIBCXXABI_ENABLE_STATIC=ON"
    "-DLIBUNWIND_ENABLE_SHARED=OFF"
    "-DLIBUNWIND_ENABLE_STATIC=ON"
    
    "-DLIBCXX_ENABLE_EXCEPTIONS=ON"
    "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON"
    "-DLIBUNWIND_ENABLE_EXCEPTIONS=ON"
    "-DLIBCXXABI_USE_LLVM_UNWINDER=ON"

    "-DCOMPILER_RT_BUILD_BUILTINS=ON"
    "-DCOMPILER_RT_BUILD_SANITIZERS=OFF"
    "-DCOMPILER_RT_BUILD_XRAY=OFF"
    "-DCOMPILER_RT_BUILD_LIBFUZZER=OFF"
    "-DCOMPILER_RT_BUILD_PROFILE=OFF"
    "-DCOMPILER_RT_BUILD_MEMPROF=OFF"
    "-DCOMPILER_RT_BUILD_ORC=OFF"
    "-DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON"
  ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "LLVM Static Runtimes (libc++, abi, unwind) for Morello Purecap";
    homepage = "https://git.morello-project.org/morello/llvm-project";
    license = licenses.asl20;
    platforms = platforms.unix;
  };
}
