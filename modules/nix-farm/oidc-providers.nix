# Shared by every farm daemon: envoy may route a call to any of them.
let
  farm = import ./settings.nix;
in
{
  # nixbot mints a token per build (services.nixbot.buildStore.oidcAudience)
  nixbot = {
    issuer = "https://buildbot.dse.in.tum.de";
    inherit (farm) audience;
    rules = [
      {
        bound_claims.effect = [ "build" ];
        scopes = [ "write" ];
      }
    ];
  };
  # People, through `nix-farm` (pkgs/nix-farm). No claim is bound: authelia
  # only lets members of the chair log in (users_filter, rbgOrgZug=DOS).
  authelia = {
    issuer = "https://auth.dos.cit.tum.de";
    inherit (farm) audience;
    rules = [ { scopes = [ "write" ]; } ];
  };
}
