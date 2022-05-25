{
  config,
  ...
}:
{
# This is used for persistent memory
  config = {
    # enable dax option for fs
    boot.kernelPatches = [ {
      name = "daxfs-config";
      patch = null;
      extraConfig = ''
	    FS_DAX y
          '';
    } ];
  };
}
