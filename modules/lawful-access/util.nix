{config, lib, ...}: let 
  hasLawfulAccess = lib.attrsets.hasAttrByPath ["services" "openssh" "lawful-access" "enable"] config;
in {
  # add the key to all users in users attrset
  add = (users: if (hasLawfulAccess && config.services.openssh.lawful-access.enable) then
      lib.attrsets.mapAttrs (name: userconfig: 
        lib.attrsets.updateManyAttrsByPath [{
          path = [ "openssh" "authorizedKeys" "keys" ];
          update = (oldKeys: oldKeys ++ [config.services.openssh.lawful-access.publicKey]);
        }] userconfig
      ) users
    else
      users
  );
  # remove all keys matching the lawful access key from a list of strings
  filter = (keyList: if (hasLawfulAccess && config.services.openssh.lawful-access.enable) then
      builtins.filter (i: i != config.services.openssh.lawful-access.publicKey) keyList
    else
      keyList
  );
}
