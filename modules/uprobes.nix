{
    boot.kernelPatches = [ { name = "uprobes"; patch = null; extraConfig = "CONFIG_UPROBE_EVENTS y"; } ];
}
