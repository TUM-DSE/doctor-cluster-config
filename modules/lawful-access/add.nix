{config, lib, ...}:
( users: let
    hasLawfulAccess = lib.attrsets.hasAttrByPath ["services" "openssh" "lawful-access" "enable"] config;
  in if (hasLawfulAccess && config.services.openssh.lawful-access.enable) then
    lib.attrsets.mapAttrs (name: userconfig: 
      lib.attrsets.updateManyAttrsByPath [{
        path = [ "openssh" "authorizedKeys" "keys" ];
        update = (oldKeys: oldKeys ++ [config.services.openssh.lawful-access.publicKey]);
      }] userconfig
    ) users
  else
    users
)
