# To update .sops.yaml:
# nix2yaml sops.yaml.nix > .sops.yaml
let 
  mapAttrsToList = f: attrs:
    map (name: f name attrs.${name}) (builtins.attrNames attrs);

  renderPermissions = (attrs: mapAttrsToList (path: keys: {
    path_regex = path;
    key_groups = [{
      age = keys ++ groups.admin;
    }];
  }) attrs);

  # command to add a new age key for a new host
  # inv print-age-key --hosts "host1,host2"
  keys = {
    # users
    joerg      = "age17n64ahe3wesh8l8lj0zylf4nljdmqn28hvqns2g7hgm9mdkhlsvsjuvkxz";
    peter      = "age1r8v7gf5wxmggsecapn2ptm3q6gjpyquw2fm3dwhr59jpmyjvzcfqd03zcd";
    cmainas    = "age1et533lu2xqnxl5k332f2q57hqxu8j7j4lrzcannqynfmf9xh2azqfzheu4";
    simon      = "age1llrudzm3dayvgcq79xq7wzynthdz4r4p4yy8rdamrsq03saukd0qqszppe";
    dimitrios  = "age1wtek04smdkn5h7nz5x5dtcjpd4l0srxjru6cpk37wgf0aurnc3sspre2e8";

    # machines
    amy       = "age137rtvc63e3rg0qtlc8nwmajqljuckjdptncd4nmk8w8hvdlcr3tsj2f8d8";
    clara     = "age1hsvqmpun5c4ht8vk9pjhppav3zdxm37h820uws07xe88gpejfs6qyzhwav";
    rose      = "age18s9fs98d44dcgn2cn9a4p3zryc0z88u2wmrs62yvyr06gzxpzdnshp70vp";
    donna     = "age1tmauqc99j526s4gpjxz335jag423utcjpldak6ealu6c796n59xqq62wja";
    martha    = "age12fzpr4rm4xwm9t8jwyeu449lsetxruv9mf9m28jqwkvs86yrlqnqn8kfcd";
    doctor    = "age1t7mujjjvczz9gsrsalegr79yp424scpx0mcxl6c3j7stmea8falqqnu9p7";
    bill      = "age1mfwpvl4fkjukpjc3502dgalvmllg5mzl8xq0p6wz2xegeev8r5ksjc2flq";
    nardole   = "age17ye252kv8u3qp0lkgknyl3jlaj8c0z92z65evaj8ss7q6axcud9s8prv32";
    sauron    = "age1t447x7xtqqhmfr026uhfn6ys62hlhseakw9qlrveadqxk7sehyysx62rq9";
    yasmin    = "age1ygw55360m3gjquperauv50u6zd6rkl2uuergycl6apf92ycc8gkqktdcm6";
    graham    = "age1qnz850jesp6l4968vqdp40mqenmtx3czhy5l8hsz4kym3aj8c56srs5dkk";
    ryan      = "age1cxtzg79g4ueqawa2hwstkkyeyq6e53q6r4te527lnjvzhujjc5ns96qehp";
    astrid    = "age1hen4wskutter8h4ypkhv7aqvh7mr9gl7pz7gd9mgln4jl2ckxq7qaks7h6";
    mickey    = "age120dyz5upjmv0z4e23vj2dhcm0c5cvm6tmwzl5sj5ye4jrjtwg4tsy3n7m3";
    dan       = "age1l86ru9amzp3g484wevpa64yjn8ppw0wn2qhud8xz05q84hvq0p0qatqpvq";
    christina = "age168tqvf7373e7wj0q8p0trzm5t0mvlp4t296uuswa98s2waerfsgqdvzmhe";
    jackson   = "age1njxdasjq883w4whexdzdzvjpw64dmndlp8zjf9tj7k47q6mgaa5sux0urv";
    adelaide  = "age1s5ksz4aysaxg6ktlts075n26e5yfyny4lcncgljzuymddu3tsvesx8qa59";
    wilfred   = "age14esukks86hdswm9tjpjpjwxquset7407ffahxk6tc3t2ayanta4swyvw5f";
    river     = "age1kkace98a960arj2qlzuuzpxxgm5r6ktw902ak6qydejdx6kxrs9q79vl4a";
    jack      = "age1t3shywg9gdlfu7k8zcwa8u2mn85d750ul60h9sdydfuxe9dssdaqucc24y";
  };

  groups = with keys; {
    admin = [ # admins may access all secrets
      joerg
      peter
      simon
      cmainas
      dimitrios
    ]; 
    all = builtins.attrValues keys;
  };

  sopsPermissions = with keys; {
    "modules/sshd/[^/]+\\.yaml$" = [];
    "hosts/amy.yml$" = [
      amy
    ];
    "hosts/clara.yml$" = [
      clara
    ];
    "hosts/rose.yml$" = [
      rose
    ];
    "hosts/donna.yml$" = [
      donna
    ];
    "hosts/martha.yml$" = [
      martha
    ];
    "hosts/doctor.yml$" = [
      doctor
    ];
    "hosts/bill.yml$" = [
      bill
    ];
    "hosts/nardole.yml$" = [
      nardole
    ];
    "hosts/sauron.yml$" = [
      sauron
    ];
    "hosts/yasmin.yml$" = [
      yasmin
    ];
    "hosts/graham.yml$" = [
      graham
    ];
    "hosts/ryan.yml$" = [
      ryan
    ];
    "hosts/astrid.yml$" = [
      astrid
    ];
    "hosts/mickey.yml$" = [
      mickey
    ];
    "hosts/dan.yml$" = [
      dan
    ];
    "hosts/christina.yml$" = [
      christina
    ];
    "hosts/jackson.yml$" = [
      jackson
    ];
    "hosts/adelaide.yml$" = [
      adelaide
    ];
    "hosts/wilfred.yml$" = [
      wilfred
    ];
    "hosts/river.yml$" = [
      river
    ];
    "hosts/jack.yml$" = [
      jack
    ];
    "modules/nfs/secrets.yml$" = [
      bill
      nardole
    ];
    "modules/k3s/secrets.yml$" = [
      bill
      nardole
      astrid
      mickey
      dan
    ];
    "modules/gitlab-runner/secrets.yml$" = [
      ryan
    ];
    "modules/secrets.yml$" = groups.all;
    "secrets.yml$" = [];
    "modules/sshd/ca-keys.yml$" = [];
    "terraform/secrets.enc.json$" = [];
  };
in {
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
