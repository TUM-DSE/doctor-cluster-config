let
  cgoPixel8Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOPHHU+BO8E/+Mn98QFbkbz9mYm5wNUTBYGOO8EMGg7o pixel8"
  ];
  cgo25RevKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK0/PSpRypoFe8NQ1BHjCyxraIvhX/0q6OIO7DYnmyq Martin Fink"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJG54b02qzOXHLPLHg0PG6uGpOrtvgS3xenhTUszPJOj martin test"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCt2vA40CycoKDOF1NcGCsg18A3vM0CdMBAbu66m7Wui3Tx8Hh5s/tw/+Mw2LYMZ7zqdAfcEw4votP3gs9wtZi/aEr1Qna3nGabKJG35Ixi1Ua1a8j3o0wSLQGv56iYFuESFtyJDxNyeH1/9L0Q9uSd8LbXzFv50BDs+pitBz1oK4tvfrbMPLtsZSoeJc4NenzJogTfQgzKTH9cmRjVbVUT+8yBLs5wvKIC9xKWb19cYOEEHSf2IUAzsmNBS+A8DnDENe3ZmI4a8SAcDHvTc1E22fHgiKSYdq38K+tQeWOTeDJuzeP9oo0OdJ8MSuf9xpitKyFBY9pvqDDIzG2YSaerNQkT0Df61ZyvslZYonblpgDANPlbLb/Ka6j/55oYKeyrPdPG/uHHJnFIBAjCdkyzXHUkmMwRfKAioAVJbgv9VRv7fhcqRQDMpCCTntikNmByYy4MMKKW90rUbBObs4mOgq9A70NB7evCxKvpVv3ZLA5o58OYeNTSkmjMpSwIcecR4dP7E7YvbWNSvlpW5hl4g7FQ7M/NXkb8f5O6u9GaRf7ecn6sHBPQHilzOinIo3mT9bKKLlIDrp8cgI4h+BOWmm8gz8VOlSzbN+TYAQOMsIufqOipO2F7bgsLGDeEWIMrmnVKRRdfQlxpkf2F7fiPQUPylkHIQkMQX34dpKtfxw== cgo_reviewer_1"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfV0gp279LyuhHryzUtOLNAl9zNc+GqV55uaMaxZ1rtzfv7Dn8BUhTQchpKd/XDZh/zHi0g5DC5pQeMrNtOqoGVtwz2/x5ld6JiNO+MFcDHixrqqYDU7GTL9z0LjR1voDx5qNPPQOKq2pAoGp/r5qG2Q/80ol/QSNTodfxeGK70+BC0WVSPcg467G1Jq3wh1tDCiOWdq7mL7BraHoiP61S7wYsRZjtQxOL58Pr1n4pkjn3QHbolGdGox7xeeuCmJ3fqhAuUkBM/TT822XAK8uoaNOQsuOlwgMnqGcTKxBM3C6Raq57Fl9M3kTHtT2eKwN/cxXIwBjl48BLaEURDkxQ482j5fCr/+nb+0LvYFdccNuxDuNWLS63tuzCJw4KIVh6/EIi4HHIUktoNQgwGXGJqfGTOG0IL8aoibrMgmjy29deCe3t3PVvFQJ/8UnrC3agAZTvaYLA4LNCnm3ttxF56VesK3KhznF5LTodi+B4Rur76THOpwfxFzd/ZmZ2wHc= cgo_reviewer_2"
  ];
in
{
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Pixel 8 connects to graham and sets up port forwarding to allow access for reviewers 
    cgoPixel8 = {
      isNormalUser = true;
      home = "/home/cgoPixel8";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4005;
      allowedHosts = ["graham"];
      openssh.authorizedKeys.keys = cgoPixel8Keys;
    };
    cgo25Rev = {
      isNormalUser = true;
      home = "/scratch/cgo25Rev";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4006;
      allowedHosts = ["graham"];
      openssh.authorizedKeys.keys = cgo25RevKeys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "risotto"
    "sppRev1"
    "sppRev2"
    "sppRev3"
    "atcRev1"
    "atcRev2"
    "atcRev3"
  ];
}
