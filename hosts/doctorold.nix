# Old monitoring VM (vmbhatotia43 / 131.159.102.4). Only forwards HTTP(S) to
# the new doctor (dosvm5) until the *.dos.cit.tum.de CNAMEs are moved.
{
  imports = [
    ../modules/nspawn-container.nix
  ];

  networking.hostName = "doctorold";
  simd.arch = "broadwell";

  services.nginx = {
    enable = true;
    virtualHosts = { };
    streamConfig = ''
      server {
        listen 80;
        listen [::]:80;
        proxy_pass 131.159.102.39:80;
      }
      server {
        listen 443;
        listen [::]:443;
        proxy_pass 131.159.102.39:443;
      }
    '';
  };

  system.stateVersion = "21.11";
}
