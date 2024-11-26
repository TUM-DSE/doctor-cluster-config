{ pkgs, lib, fetchFromGitHub, buildLinux, modDirVersionArg ? null, ... }@args:
buildLinux (args // rec {
    version = "6.0";
    modDirVersion = "6.0.0";
    # modDirVersion = "6.6.56";

    # src = pkgs.linuxPackages_6_6.kernel.src;
    /*src = fetchFromGitHub {
        owner = "Meandres";
        repo = "linux";
        rev = "7748b27fd6fb75621d7ff5e7ff5ec359f5a96613";
        sha256 = "sha256-dWiGPhRoYtesaun+umDd9OPg6vD2pV3quQv5vZQaJrQ=";
    };*/
    
    /*src = fetchFromGitHub {
        owner = "intel";
        repo = "uintr-linux-kernel";
        rev = "9a56ee83edfc42c8df41f6983096e8ab1a890ecd";
        sha256 = "sha256-C6QlavVWd3W84mjTRy1rdGX2Li5mk3jt3/y2ZO7JM1o=";
    };*/

    src = fetchFromGitHub {
        owner = "yhtzd";
        repo = "uintr-linux-kernel";
        rev = "52cbe519c39cf035b981f07f8c653a58cbdadac8";
        sha256 = "sha256-acfaUQELGip6PQ+PWjJLp1Jl99lv+uHbQSKk6dJoYZ8=";
    };

    kernelPatches = [{
        name = "uintr-config";
        patch = null; #./uintr.patch;
        extraConfig = ''
            X86_X2APIC y
            X86_MCE y
            KVM y
            KVM_INTEL y
            X86_USER_INTERRUPTS y
            X86_UINTR_BLOCKING n
            '';
        # maybe enable X86_UINTR_BLOCKING later on
    }]; #++ pkgs.linuxPackages_6_6.kernel.kernelPatches;
    extraMeta.branch = version;
    ignoreConfigErrors = false;
} // (args.argsOverride or { }))
