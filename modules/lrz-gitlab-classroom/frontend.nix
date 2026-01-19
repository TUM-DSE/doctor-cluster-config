{ pkgs, ... }: let
  frontend-code = pkgs.fetchFromGitHub {
    owner = "pogobanane";
    repo = "lrz-gitlab-classroom";
    rev = "8bee18be567fcb03b7d5b37af1222a34669692e9";
  };
in {
  services.nginx.virtualHosts."assignments.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;

    locations."/".proxyPass = "https://pogobanane.de/";
  };
}
