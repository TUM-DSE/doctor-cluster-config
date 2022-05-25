{
  config,
  ...
}:
with lib; {
  config = {
    # enable dax option for fs
    boot.kernelPatches = [ {
      name = "daxfs-config";
      patch = null;
      extraConfig = ''
	    CONFIG_FS_DAX y
          '';
    } ];
  };
}
