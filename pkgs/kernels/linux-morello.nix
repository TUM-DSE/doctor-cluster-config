{
  buildLinux,
  fetchFromGitLab,
  callPackage,
  stdenv,
  overrideCC,
  ccacheStdenv,
  llvmPackages_16,
  ...
}@args:
let
  llvmMorello = callPackage ../compilers/llvm-morello.nix { };
  llvmPackages = llvmMorello;

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

        stdenv = llvmMorello.stdenv;

        src = fetchFromGitLab {
          inherit
            domain
            owner
            repo
            rev
            sha256
            ;
        };

        extraMakeFlags = [
          "LLVM=${llvmMorello}/bin/"
          "LLVM_IAS=1"
        ];

        kernelPatches = [
          {
            name = "enable morello";
            patch = null;
            extraConfig = ''
              ARM64_MORELLO y
            '';
          }
        ] ++ extraPatches;
        extraMeta.branch = version;
#        ignoreConfigErrors = true;
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
    extraPatches = [
    ];
  };
in
# change here to change kernel
buildMorelloKernel morello_1_8_1
