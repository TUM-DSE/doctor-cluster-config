{ modulesPath
, ...
}: {
  imports = [
    "${toString modulesPath}/virtualisation/lxc-container.nix"
  ];
}
