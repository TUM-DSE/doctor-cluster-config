{ config, ... }:

let
  # Vincent Picking (bachelor)
  vincentKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDnR/hVO9bNFxc29M4E9wdgTTvlgIF62V6gflw0eKVDSNcKNyFIqDySWRVJna8OKt6cO68orHDKGo8VJxw9QIf/wnDTZseufzbUnFE/fMo56HgfTvdTYZtUyhJmoxf0IcA4DZRkEHklTZQUf2cIXi6DgUejiy2r4JhtOHFL6PIUivGLPtfsmgoy8hiVW2JN6asdAlNcznxKLhN9lOcvLlJtNcVpFx3ZjN6vLHVFfGxQdCCj6dWzwyjynPbqBUMIhMC7tuPzDJ7aBwTNV3ydpkGIvoVjJPZsbi4S1pDUs0P+aiwZaTmrGUFaVdQAP9S8De9YCrD24K7H6VspCGNwSqszj9m65M8pzm3HHEtYwNrPHjYWiS3fvLilDuDC5w0tGm9f3upsKqAC3u4CxsSgWFoPVza1mIVfsbK1YOOGBKbSx7PzQSrJLj6QqPW0Y1kMQ26VSDpc+hT4OonbQ9hh4QZZ5WecfRsE+2iJDQU0l/yasMaXG3PW7OcGg5l40t4xVP2ZRM3TURhKIXNxmVhMjRM9DZdaeZwVioIgogVfmd1XkRcoPq4NPFdwxSlzG/p6ZvTCtGw2Oq23W/bM/NTOhBtDK7+OQH4JGHhuxmndXImE96Vd05W25Adr1+F4xcEZzZlcUgbwn/WcNDvjryqTHiBcS622GsOWkZJKbWWBKhUmqw== vincent@hackatop
  '';

  # Peter Okelmann
  okelmannKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDITBcN9iw5Fn7yyfgiWFet3QWDoMcUNtzLi+PNoYS7jksvcKZy5pLOjE6wCpkbYx+Tcb4MyvoWPXvwdo5FfL4XdhZRO+JlZ66p/rGssq/wEr2BBUwohP7o39JLtiyXGXSsK6MO2aceOFLQr4KAdaeD8ST0XumGcV6bGqIbjFsK5FCxFhO8NkCFtavBjDwKUm3uyOnVCWMp12abUphzxrVtWhcsnw5GapohATP03mCNxmrn/L7x393HutxgjyduScX7++MjwVE6J7wCnztPUtJbh9jYemr/K9fBMBbLhQagOjrlQYGU5frgmLrPCRZusyg5HjWx6gJIxs/DskfgmW+V
  '';

  philipKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMI+21MFo1RlD0Urx8bTJHJZnRNRSGuN9IZ6Ld7M2JS philip@x541uj
  '';

  mlKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj82MjggZ8uEbi/1cITRA84Ou2I6TYfCPfFHwhXm2Tx ed25519-key-20210927
  '';

  # Paul Heidekrüger
  paulKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6/nkUEjr09814INiM8+GS9x4RY8j/ulMVFiTsYTxCcbhCWFGgQ6NS+kg2iTtthHzsgaXddfoy2Zy6FwTTFpaekK30ZZaNPFK9h/Z8Nry6TgYJhPbe5ftinf8gWkhihGk4SnjVCGIc+eOK5MsS31stPReYEkeqtnbLiRzGgk2MmgworouHMy3x8N9nfcRWZVAQMzYeZtz9eqAB4T81zEPLcd9bHWziYr7Qy0nCc9aVQ3C/OkNT8yDinYIqaoDRRuiCfK5WhRzv2Sid7Qq5md2CVgctsM8GAOX6HMsmNN3JmElfUgE5eJpkpfp0GVEbYcZZyIlKXe0Oz3fECbSq78+PvdJkKs2pidU6KhoCuOGED9RQwXfeCxQL09Um6wCFmdr+A4XBIFSAbxxeHrM2bdQccxp4FLpiXJpI8hOJNCo4I6gnpYlv+DBjjm0h5+9Eb/Eq0d8Mz9BWBvO1ltbJMvA/S32AQyVUZKndNQ/K9oVdAXcDM0PFrkad8k5rRJK4QsfzY6b8zSbYuk2bA2cKxz29+8PJcbWZcSf+yyN3+ELFu2E2F3mgx/doPBgMk4y9gHRwr7HiN+7eYwiLVnF402f46D2bpj8LFGsCkeAbHS4DKFdn3vAOTs1wGK3cmgTQnH/edfaEN+zmuXXgh4gUr64vRyra+rn3PGbPQTRAmzoA3w== paul.heidekrueger@tum.de
  '';
  
  # Jasper Ruhl (guided research)
  jrKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYva//qGT0//ljbMjZjX1ugxQjHJir8/Qp1yxy8ZDFCY7rwLi15M69/ZQ8NplU53bkW4ezqkf9CON80NpzfGTuyi7FO28JeWbHovyyHymkUM2wcFjAXOjQKgXz7NRKswZSDAdjZcX7nxHoqY4yI5fBy/9yYNrcdvKZ8NcCGFyhHQijdLUwo4hfOWKIHp4j4tLjQ0T7nKHmcuE+o5xr54EZpAvhQgyPFxrxYiLxX08ksDCykWocgJIiEDVBpw58vTQJxWzRMab/AnWs2FesKOKOfzy9wXa3ze++kb0WVzairhxj5lI2MUAZiE8nCEGBy7jiIDsQ3CaWMFpfvQHnvkd5 jasper@debianj
  '';
  
  # Martin Fink (guided research)
  mfKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK0/PSpRypoFe8NQ1BHjCyxraIvhX/0q6OIO7DYnmyq Martin Fink
  '';

  # Alexandrina Panfil (master thesis with Dimitrios and Jin)
  alexaKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/CRonODrMJoSAqiJh6ZsJuYDTVgUGyYjaR3HRR/zoMSIfiPXGny8T18tvvY7TW4EmXbXtR2zujgmb4Q50+Q0rV0HzwFp40EpGT0JCyZBB+HjdcbKY+hPMNLzGDt2qlAsp0qoXNW/3MrlmcQPMetQOGyTyeI1rDCbZjAxu3cS8+8dt5PjuO4oB7MAvKZdk4mMU2G46bCB/MKfS+vUcUGQZxSYU+GLS8SaH+Vrmi+jfCTJsgUjLwp2QwRQQ4YJzjXMptUtisWoAA5tcQuDYvd2CkorSLLKss9A0HxzJRm0zmd83/sLa3mv1fcCTy8BKnBfyNuX69btjCPafkQZ31ZvX73IsWM59lHt7//ZVOKTsY1yDvRL89RgqBECltLhzVp+pWfaa1Baln+5e+oLy4njLf/goq94p6+HeSiENXjAxmonarGI/Z6yCM7u2JD6YJSak11NytKzgHbbVQ+srDUvMT4w4ejUowSQPMQ1enV9ObSqz7WmfK0jxQjFMGm2aRW8= root@4a431c59236c
  '';
in
{
  users.users = {
    # master thesis (joergs student)
    okelmann = {
      isNormalUser = true;
      home = "/home/okelmann";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1008;
      openssh.authorizedKeys.keys = [ okelmannKeys ];
    };

    # Moritz Lumme (internship)
    ml = {
      isNormalUser = true;
      home = "/home/ml";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1014;
      openssh.authorizedKeys.keys = [ mlKeys ];
    };

    # Master thesis (dimitrios student)
    # finished, Remove before christmas
    philip = {
      isNormalUser = true;
      home = "/home/philip";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 1011;
      openssh.authorizedKeys.keys = [ philipKeys ];
    };

    # Paul Heidekrüger, Babish's BA student (Dependency ordering in the linux kernel)
    paul = {
      isNormalUser = true;
      home = "/home/paul";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1007;
      openssh.authorizedKeys.keys = [ paulKeys ];
    };

    # bachelor thesis (dimitrios student)
    vincent = {
      isNormalUser = true;
      home = "/home/vincent";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/fish";
      uid = 1013;
      openssh.authorizedKeys.keys = [ vincentKeys ];
    };
    
    # guided research (redha student)
    jasper = {
      isNormalUser = true;
      home = "/home/jasper";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/fish";
      uid = 1015;
      openssh.authorizedKeys.keys = [ jrKeys ];
    };
    
    # guided research (rodrigo/redha student)
    martin = {
      isNormalUser = true;
      home = "/home/martin";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1016;
      openssh.authorizedKeys.keys = [ mfKeys ];
    };

    alexa = {
      isNormalUser = true;
      home = "/home/alexa";
      uid = 1017;
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      openssh.authorizedKeys.keys = [ alexaKeys ];
    };
  };

  # only used by vincent atm (and jasper)
  programs.fish.enable = true;
}
