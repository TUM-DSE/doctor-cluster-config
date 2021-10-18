{ config, ... }:

let
  # Marcel Schneider
  schneiderKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdxfCwhVGRNSGPJu1nseRJsCaQuyuW3jl+fpQ3/Mk43eg6QtJUwj9tbY+wfS0uNvHeOhA+i7I+KVStt4/8VFnXZs6eRGGnIiATln29vfqCl6ehcTz5FdUflfqDJq4VZ3z+8elUFUPQYkZzY1U+B6u/GM4AVnXShktihmUIkFi25zDk/GSixJsheVzk1/vYo+dOG77L3l1NuoluJ19Yu45Xxu6BsRvSdbTqPUfbrCndhRfBRXi1j7fsV57GfZGwNRsx3pf8WavHh+EAaezr+gk28siR+ONU0uTh8PZzLcWVou9YUhk2zLAZBbS06hWOJuPh65jhQvY9xidRRuHfMczmD8fhMjWZAkZoDoEr30L5CrtqsEzId3F60YTL6U7ENETZ453E2FC0Zn939nby15AOyV28fkMEEdaWf7NjlKw/kYsq1vuQA96I62aF4nRT2ufow1/csBsZJbWQD/CT5dCkmWHEcXZ5dTpRGVNG1z4X8P4ro+xkCQG3yd9RcCDk+8c= marcel@DESKTOP-VOU8DN0
  '';

  # Pablo Sichert
  sichertKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCulQs2jdcjZsI8KWmVNH6Aw+zz2LgOnDjoZ2UFCmZn8nvaChI0RPIQD+E1766sOk2q8zUg9dOS3WVR5v4Kn1ueu/YIVTetYFXYueMH1vWt1HIH376ivi6elklBsVSRRC/b2etBBGHXpXAjEmfeU2zSfabhDgXaitVbJBiIzfTqKXtW2X/EN+EJ70u3vl2mAz03n5Eh+h58zJij6k/1G82tpH2zJhzBZ8uGTr4dF2SF6XrFBmOa+GM5P5tvtqs+5CxF2DWacEMth0JcCYaUn+nxsAVPIi8NHNtO+7LzR201r916WSu8JUABz5UQ2XKKcsALT3mqEjsC+m5hpQ12/SAcn5Pdy2Dymxr3gAAPye7R6Qio/EpONnFfKY1NImW26iKXK+9I94YR54AQBMn0u3FOkPi31xj8v14HfVL+iCadEDvoYoErx6OgInnpEWShoAu4CHdglUE7jBTK325rQHWQe7P8nitpFi5SHrY4Z/8a5PX2YHTVvTv1aVoNqB8/fIE=
  '';
in
{
  #OS management course users
  users.users = {
    # Marcel Schneider
    schneider = {
      isNormalUser = true;
      home = "/home/schneider";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 3000;
      openssh.authorizedKeys.keys = [ schneiderKeys ];
    };

    # Pablo Sichert (internship)
    sichert = {
      isNormalUser = true;
      home = "/home/sichert";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 3001;
      openssh.authorizedKeys.keys = [ sichertKeys ];
    };
  };
}
