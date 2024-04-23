{ ... }:
let
  sppRev1Keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDE37P+xLLfdWu70u9zJ3nwpDtKVyR0TKWbenWhRlwpJazbAbdH1x9loeBt4QrVhZvG0y41vN4I08FihM/9ySuQvYKLTkVtk6uGXkFnqf6+frhEK3Wc6pJcXWBMDEgfxOgHApYBAIdqok6b/PQu2SlbqZilOdJHS/l8zsVpdY7TDyKQjjUTh44eSYKbeTWYLuUUF5zGmAyeKsBrLxtlZgIXAArhpo5+6MGs6AD/IanJ/SqFLZs0/FC5VNfnn5fOaUaJ9F095tENUEqSPapsqdWdZFbptspdgILim9kaVKZVkSTPB9lqVSaXmO61ZarXabmgVTbF9xUFVBz6bNpseFgVzMRn7zi2ZTiHvfxY/HO6RdLeBFnsasPIDxk73UUgmxl7MoIUcEONEjIpbo7bv8hZyvvJntynBajz06GWw4ewQDGgegKq4a56ix80nmk4qA1Hycnnx2IcqkLFWaEmC9WRmlgFW8ecpt3RE4BPVdxjI5R7UjdcBUR4HrPZuvLYSbakB8v3V2D8k3qe3H0VIRlKH7WBguWbnNPbx6UBVw48XBA8UUFppjbdbSug8y+TA8Xj4G9jhwMF4ALCwCqjZzNYZNUhx72gFRrmFbNh8vmLsXYmmI4OxCI3ayodRtmZHzHkIaFiYOg22iXODeo8reQG+uB6l5psZdhbY2HsIUyMMQ== test"
  ];

  sppRev2Keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2xdhpNGTmBU3GE5cTaqqs1v2OCQiXUWSViU+w5Wjr33Lu/nkIg97hI5Ili+5D2dRZU/I6WTnhwYF5F0gMLqReb4wvaFDRin55GRP99shcHnxj+Mh3Cq7KScMyO9pV7Xt0qsBBivTsvQ2h8MoSg2X/zmwWfHwTabm6FwzZGV5AKDaLq+AeXxWDniDsGulugjFVxmgAH0cUvT6KJ8+UUoGvPeTlkLVGgyy1e/oRLlnMcm6hIgR7x/8JHhraTKbFFIpD+QwE0dr/OLuUCp04iaavU54S5QtOc31I93286An2E/Ut2F6eH/evZGe5duosOgG9RJsVY5gy80K8u+VJCGLT"
  ];

  sppRev3Keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfE76mn85zU953Iw0y8LA6nHRcBQyE6PsRW5NbJ7JPpzwQmNTPvdrrlk56UoTnTIymKq/gXyqqqOifgzCt0Yi9ok/a0WIdCkUZqxlSWTeu6aJnS2gELPtvHhzapwjd0LaRKENBt1gfuc95oUNWIfKXz89Mh6fvQyILWfVXd+njGYREjF72qhugdQ9KjLW5Mt+w02QttnR49ZGB69/rQZA6TMkdZEsp3xAQjCNAkQiPM3kwdmBYEgZ7b2cuSldRpVlSkLMGyZHmK0pDuzQgsd420lagCxeXqiFaW2ZnZavp9hVn7PMzvJyc1R2mPtvKDu+J1iQb94iK21oLkRAGCxXH test"
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

    # SPP AE reviewer 2
    sppRev2 = {
      isNormalUser = true;
      home = "/home/sppRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4006;
      allowedHosts = [ "jack" ];
      openssh.authorizedKeys.keys = sppRev2Keys;
    };

    # SPP AE reviewer 3
    sppRev3 = {
      isNormalUser = true;
      home = "/home/sppRev3";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4007;
      allowedHosts = [ "jack" ];
      openssh.authorizedKeys.keys = sppRev3Keys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "risotto"
  ];
}
