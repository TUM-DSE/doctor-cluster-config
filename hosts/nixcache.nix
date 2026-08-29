# nspawn container on dosvm4.cit.tum.de: niks3 binary cache (niks3/cache.dos.cit.tum.de)
{
  imports = [
    ../modules/nspawn-container.nix
    ../modules/niks3
  ];

  networking.hostName = "nixcache";
  simd.arch = "znver4";

  security.acme.defaults.email = "joerg.letsencrypt@thalheim.io";
  security.acme.acceptTerms = true;

  system.stateVersion = "26.05";
}
