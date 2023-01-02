{ buildLinux, fetchFromGitHub, modDirVersionArg ? null, ... }@args:

buildLinux (args // rec {
  version = "5.12.14";
  modDirVersion =
    if (modDirVersionArg == null) then
      builtins.replaceStrings [ "-" ] [ ".0-" ] version
    else
      modDirVersionArg;
  src = fetchFromGitHub {
    owner = "VmuxIO";
    repo = "linux";
    rev = "56b6b3611b3a57940a314673e1c7aecbc07976e1"; # branch peter/5.12.14-v0
    sha256 = "sha256-VKtKBIbUoRGp2xJA7VQvjRGPaTaNP04vrjMXDpmOje8=";
  };

  kernelPatches = [{
    name = "enable-kvm-ioregion";
    patch = null;
    extraConfig = ''
      KVM_IOREGION y
    '';
  }]; # ++ linuxPackages_5_14.kernel.kernelPatches;
  extraMeta.branch = "5.14";
  ignoreConfigErrors = true;
} // (args.argsOverride or { }))
