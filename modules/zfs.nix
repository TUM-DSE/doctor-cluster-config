{ ... }: {
  services.zfs = {
    autoSnapshot.enable = true;
    autoSnapshot.monthly = 1;
    autoScrub.enable = true;
  };
  # 5.12 is too new
  boot.zfs.enableUnstable = true;
  networking.hostId = "8425e348";
}
