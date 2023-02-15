# To update .sops.yaml:
# $ inv update-sops-files
let
  mapAttrsToList = f: attrs:
    map (name: f name attrs.${name}) (builtins.attrNames attrs);

  renderPermissions = (attrs: mapAttrsToList
    (path: keys: {
      path_regex = path;
      key_groups = [{
        age = keys ++ groups.admin;
      }];
    })
    attrs);

  # command to add a new age key for a new host
  # inv print-age-key --hosts "host1,host2"
  keys = builtins.fromJSON (builtins.readFile ./keys.json);
  groups = with keys; {
    admin = [
      # admins may access all secrets
      joerg
      peter
      simon
      cmainas
      dimitrios
      atsushi
      patrick
      myron
      francisco
    ];
    all = builtins.attrValues keys;
  };

  # This is the list of permissions per file. The admin group has permissions
  # for all files. Amy.yml additionally can be decrytped by amy.
  sopsPermissions =  builtins.mapAttrs (name: value: (map (x: keys.${x}) value) ) (builtins.fromJSON (builtins.readFile ./sopsPermissions.json)) //
	{
	"modules/secrets.yml$" = groups.all;
	"secrets.yml$" = [ ];
	"modules/sshd/ca-keys.yml$" = [ ];
 	"terraform/secrets.enc.json$" = [ ];
	"terraform/github-permissions/secrets.enc.json$" = [ ]; # is a symlink to terraform/secrets
	};      
in
{
  creation_rules = [
    # example: 
    #{
    #  path_regex = "foobar.yaml$";
    #  key_groups = [
    #    {age = groups.admin ++ [
    #      "key3"
    #    ];}
    #  ];
    #}
  ] ++ (renderPermissions sopsPermissions);
}
