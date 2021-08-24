{ config, lib, pkgs, ... }:

{
  users.users.fsgqa.isSystemUser = true;
  users.users.fsgqa2.isSystemUser = true;
  users.users."123456-fsgqa".isSystemUser = true;
  users.groups.fsgqa = {};
}
