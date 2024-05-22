let
  atcRev1Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbZSdnpG8qR8brKRl44z4YbxeivsgAYermfGzSwscfg atc-artifact"
  ];
  atcRev2Keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+maoAUentlWXPqn1WgO7vBUYotVBMj0PU1I63y53eAwJZjdj38NkYO5Z5xwt/pBpAl1exBL0nob1lbPcSq7pcwC3hAp29NxI8fKrQ9Y0SrsszeSagul0b2E1381eUhCRS1+1y81myPmnyBK6bDHI1NCZVP9IXoXoqA1QEyiyPpZGh+qkRX3Th9y+pmkxlUEGWRS3K3Pv0L2d4NFrHG9mUx/uvJNi1oOfKjIfMrs5qPJD/f8fsiMc8R9SaLHf2Lbv/KmHNbpwcIV5OkF7Xc1gol/fu1c7p7/fp4sx6M+t9gy6Zct7dMvF16PLlFi8Tt80hFaTQY+biJQwZcxJW53jd2jlNuHSlnE2TaNZBu3EXaXmoACkkvN6lsm9xAeZggMG19vKDZcxH/Fu+d7GhK86haQnr13AcSKxROYpdsyBmKcV5UFTZXurtnugflTHkAS9azZPazpforS9g1WfTg4AhsP54zNDojlF3iGwiGfX6SI22Oagbog9sNXwyRH5ofosUeRWM0RZj+3zEe80cnt6AAanhO8CboSc4qtQ+IS5+V6QB04srlhlFAmtC4q0xkbhDrbUQQc28+Xm2wAibVWpAL9+AEdrqw7cY2gCZ/zEVpO3fxCZNQ6Z3b8O3puv0r434fh7TbqQcScp0gLN5NGdqa7ijTmlQzAY33nBEO42dFw== atc-ae1"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID2YBVW8L/0zj9IKnvhJZ7puwvaNUpVC70AN8kajzYT9 atc-ae2"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhxjg2BZHbsNLwjQgZP48XYEb9Box8M/icu96EUH/BEiBpwWU+e5eyqd9QoO/MygEz/sgPR+KtnYkMB0qNca3DSm5IwndMZlDkhOPtd6H89KMz/vU1LiJQfkFe1NspDufbtzZTFMlNSwHAxeamoAqX8aJYeyPr8XvEt6O++j43G/ZJO3FNNfPXN9ZoaBp4UDsRHlX54etxwHlqKmWG7xVT7uG2rhZ2+wX5gVA4UyMe5Dvyy0nK62slNRCSc+JitupKfhQkbKmpNMASK/x9Rpq0HzSMfLMEGxPfJPhqIT6DWYgPMJW5ya32iAtSPE7InoFwCDNBjaemvTKB+Ozptq3x+EhASO7sUVHVPC1EzuA5w+Tq1Htt5KAP68gsPPAAdn67AvEKUZvhYuIv6KakRuVk5qFsJl80m0iH/Gvn61v1jjrEoPoQuHnBSTiAxuWAlNgbzj0Ovf8PoxHXYKxRaE1AO6M2Ab95v+KWQZ5Xidb44QE+yo1K0wBpcKrcNRc0pcpqW5GKBw2LlciB2YPmvNvxB94N+Zl3XAEy66rMRyrF3VQEj2+CezfePOyqfRB7kcJj1p0scF/1CFhQERkoO9lt91tsm5WcNmXwXJFVlx+3/Tl4bZmbbShPsIvWTuyDwHZps3MKefjva2f3q/ZcIYItc1Ey7HVrv6SsYEUTn+t44w== atc-ae3"
  ];
  extraGroups = [ "wheel" "docker" "input" ];
in
{
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # ATC AE reviewer 1
    atcRev1 = {
      isNormalUser = true;
      home = "/home/atcRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4002;
      allowedHosts = [ "amy" "clara" ];
      openssh.authorizedKeys.keys = atcRev1Keys;
    };
  };

  users.users = {
    # ATC AE reviewer 2
    atcRev2 = {
      isNormalUser = true;
      home = "/home/atcRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4003;
      allowedHosts = [ "amy" "clara" ];
      openssh.authorizedKeys.keys = atcRev2Keys;
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
  ];
}
