# IMPORTANT when changing this file, also run
# $ inv update-sops-files
# to update .sops.yaml:
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
  keys = builtins.fromJSON (builtins.readFile ./pubkeys.json);
  groups = with keys.users; {
    admin = [
      # admins may access all secrets
      joerg
      joerg-mac
      peter
      cmainas
      dimitrios
      atsushi
      patrick
      francisco
      mmisono
      ilya
      felix
      anatole
      jiyang
      martin
      aleksandra
      thore
    ];
    all = builtins.attrValues (keys.users // keys.machines);
  };

  # This is the list of permissions per file. The admin group has permissions
  # for all files. Amy.yml additionally can be decrytped by amy.
  sopsPermissions = builtins.listToAttrs (mapAttrsToList (hostname: key: { name = "hosts/${hostname}.yml$"; value = [ key ]; }) keys.machines) //
    {
      "modules/sshd/[^/]+\\.yaml$" = [ ];
      "modules/secrets.yml$" = groups.all;
      "secrets.yml$" = [ ];
      "docs/hosts/craig.sops$" = [ ];
      "modules/sshd/ca-keys.yml$" = [ ];
      "terraform/secrets.enc.json$" = [ ];
      "terraform/github-permissions/secrets.enc.json$" = [ ]; # is a symlink to terraform/secrets
      "pkgs/install-iso/secrets.yml" = [ ];
      "hosts/adric.cfg.sops" = [ ];
    } //
    builtins.mapAttrs (name: value: (map (x: keys.machines.${x}) value)) {
      "modules/nfs/secrets.yml$" = [ "mickey" "dan" ];
      "modules/k3s/secrets.yml$" = [ "astrid" "mickey" "dan" ];
      "modules/niks3/secrets.yml$" = [ "astrid" "doctor" ];

      "modules/users/xrdp-passwords.yml$" = [
        "amy"
        "clara"
        "graham"
        "rose"
        "ryan"
        "joy"
        "jamie"
        "ryan"
      ];
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
