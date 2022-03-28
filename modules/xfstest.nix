{
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.fsgqa.shell = "/bin/sh";
  users.users.fsgqa.isNormalUser = true;
  users.users.fsgqa.group = "fsgqa";
  users.groups.fsgqa = {};

  users.users."123456-fsgqa".shell = "/bin/sh";
  users.users."123456-fsgqa".isNormalUser = true;
  users.users."123456-fsgqa".group = "fsgqa";
  users.groups."123456-fsgqa" = {};

  users.users.fsgqa2.shell = "/bin/sh";
  users.users.fsgqa2.isNormalUser = true;
  users.users.fsgqa2.group = "fsgqa2";
  users.groups.fsgqa2 = {};

  users.users.daemon.isSystemUser = true;
  users.users.daemon.group = "daemon";
  users.groups.daemon = {};

  users.users.sys.isSystemUser = true;
  users.users.sys.group = "sys";
  users.groups.sys = {};

  users.users.bin.isSystemUser = true;
  users.users.bin.group = "bin";
  users.groups.bin = {};
}
