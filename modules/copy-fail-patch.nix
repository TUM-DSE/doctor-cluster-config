{ lib, ...}: {
  boot.kernelPatches = [{
    name = "mitigate copy fail CVE-2026-31431";
    patch = null;
    structuredExtraConfig = with lib.kernel; {
      # CRYPTO_USER_API = no;
      # CRYPTO_USER_API_RNG_CAVP = no;
      # CRYPTO_USER_API_ENABLE_OBSOLETE = no;
      CRYPTO_USER_API_HASH = no;
      CRYPTO_USER_API_SKCIPHER = no;
      CRYPTO_USER_API_RNG = no;
      CRYPTO_USER_API_AEAD = no;
    };
  }];
}
