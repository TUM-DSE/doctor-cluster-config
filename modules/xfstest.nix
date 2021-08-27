{ config, lib, pkgs, ... }:

{
  users.users.fsgqa.shell = "/bin/sh";
  users.users.fsgqa.isNormalUser = true;
  users.users."123456-fsgqa".isSystemUser = true;
  users.groups.fsgqa = {};
  users.users.fsgqa2.isNormalUser = true;
  users.users.fsgqa2.shell = "/bin/sh";
  users.users.fsgqa2.group = "fsgqa2";
  users.groups.fsgqa2 = {};
}
