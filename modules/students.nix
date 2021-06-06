{ config }:

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
in
{
  imports = [ ./students.nix ];
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

    # master thesis (dimitrios student)
    philip = {
      isNormalUser = true;
      home = "/home/philip";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 1011;
      openssh.authorizedKeys.keys = [ philipKeys ];
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
  };

  # only used by vincent atm
  programs.fish.enable = true;
}
