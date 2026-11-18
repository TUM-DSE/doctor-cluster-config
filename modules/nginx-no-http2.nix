{ lib, ... }:
{
  # TODO: remove once CVE-2026-123633 and CVE-2026-123007 are fixed in nginx.
  # Both rely on HTTP/2, so force it off for every vhost on every host.
  options.services.nginx.virtualHosts = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        config.http2 = lib.mkForce false;
      }
    );
  };
}
