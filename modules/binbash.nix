{ pkgs, ... }:
{
   system.activationScripts.binbash = ''
     echo foo
     mkdir -m 0755 -p /bin
     ln -sfn ${pkgs.bash}/bin/bash /bin/.bash.tmp
     ln -sfn ${pkgs.bash}/bin/bash /bin/.bash.tmp
     mv /bin/.bash.tmp /bin/bash # atomically replace /usr/bin/env
   '';
}
