{ ... }:
let
  sppRev1Keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDE37P+xLLfdWu70u9zJ3nwpDtKVyR0TKWbenWhRlwpJazbAbdH1x9loeBt4QrVhZvG0y41vN4I08FihM/9ySuQvYKLTkVtk6uGXkFnqf6+frhEK3Wc6pJcXWBMDEgfxOgHApYBAIdqok6b/PQu2SlbqZilOdJHS/l8zsVpdY7TDyKQjjUTh44eSYKbeTWYLuUUF5zGmAyeKsBrLxtlZgIXAArhpo5+6MGs6AD/IanJ/SqFLZs0/FC5VNfnn5fOaUaJ9F095tENUEqSPapsqdWdZFbptspdgILim9kaVKZVkSTPB9lqVSaXmO61ZarXabmgVTbF9xUFVBz6bNpseFgVzMRn7zi2ZTiHvfxY/HO6RdLeBFnsasPIDxk73UUgmxl7MoIUcEONEjIpbo7bv8hZyvvJntynBajz06GWw4ewQDGgegKq4a56ix80nmk4qA1Hycnnx2IcqkLFWaEmC9WRmlgFW8ecpt3RE4BPVdxjI5R7UjdcBUR4HrPZuvLYSbakB8v3V2D8k3qe3H0VIRlKH7WBguWbnNPbx6UBVw48XBA8UUFppjbdbSug8y+TA8Xj4G9jhwMF4ALCwCqjZzNYZNUhx72gFRrmFbNh8vmLsXYmmI4OxCI3ayodRtmZHzHkIaFiYOg22iXODeo8reQG+uB6l5psZdhbY2HsIUyMMQ=="
  ];

  extraGroups = [ "wheel" "docker" "input" ];
in
{
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # SPP AE reviewer 1
    sppRev1 = {
      isNormalUser = true;
      home = "/home/sppRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4005;
      allowedHosts = [ "jack" ];
      openssh.authorizedKeys.keys = sppRev1Keys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "risotto"
  ];
}
