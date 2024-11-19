{
  pkgs,
  lib,
  config,
  ...
}:
let
  VMs = {
    # spare IPs for VMs: 
    #  - il01_16, qemu3.dos.cit.tum.de, 96:83:AA:A4:06:34
    #  - il01_14, qemu3b.dos.cit.tum.de, 96:83:AA:A5:06:34
    graham = [
      rec {
        name = "qemu1";
        mac = "96:83:AA:A0:06:34"; # il01_16, qemu1.dos.cit.tum.de
        macB = "96:83:AA:A2:06:34"; # il01_14, qemu1b.dos.cit.tum.de
        autostart = false;
        uses-doctor-bridge = true;
        execStart = pkgs.writeShellScriptBin "doctor-vm-${name}" ''
          ${pkgs.qemu}/bin/qemu-system-x86_64 \
            -cpu host \
            -smp 8 \
            -enable-kvm \
            -m 32G \
            -device virtio-serial \
            -drive file=/scratch/doctor-VMs/qemu1.qcow2 \
            -drive file=/scratch/doctor-VMs/user-data1.img \
            -net nic,macaddr=${mac},netdev=user.0,model=virtio \
            -netdev bridge,id=user.0,br=doctor-bridge \
            -net nic,macaddr=${macB},netdev=user.1,model=virtio \
            -netdev bridge,id=user.1,br=doctor-bridge \
            -nographic
        '';
      }
      rec {
        name = "qemu2";
        mac = "96:83:AA:A1:06:34"; # il01_16, qemu2.dos.cit.tum.de
        macB = "96:83:AA:A3:06:34"; # il01_14, qemu2b.dos.cit.tum.de
        autostart = false;
        uses-doctor-bridge = true;
        execStart = pkgs.writeShellScriptBin "doctor-vm-${name}" ''
          ${pkgs.qemu}/bin/qemu-system-x86_64 \
            -cpu host \
            -smp 8 \
            -enable-kvm \
            -m 32G \
            -device virtio-serial \
            -drive file=/scratch/doctor-VMs/qemu2.qcow2 \
            -drive file=/scratch/doctor-VMs/user-data2.img \
            -net nic,macaddr=${mac},netdev=user.0,model=virtio \
            -netdev bridge,id=user.0,br=doctor-bridge \
            -net nic,macaddr=${macB},netdev=user.1,model=virtio \
            -netdev bridge,id=user.1,br=doctor-bridge \
            -nographic
        '';
      }
    ];
  };

  # return VMs.${config.networking.hostName} if it exists, otherwise return []
  attrOr =
    attrset: attr: or':
    if lib.hasAttr attr attrset then attrset.${attr} else or';
  currentHostsVMs = attrOr VMs config.networking.hostName [ ];
  services = lib.forEach currentHostsVMs (vm: {
    "doctor-vm-${vm.name}" = {
      wantedBy = lib.optionals vm.autostart [ "multi-user.target" ];
      after = [ "network.target" ];
      # enable = true;
      unitConfig = {
        # 1440 min per day / 5min per restart = 288 restarts per day
        StartLimitInterval = "1 day";
        StartLimitBurst = 288;
      };
      serviceConfig = {
        Type = "simple";
        ExecStart = "${vm.execStart}/bin/doctor-vm-${vm.name}";
        Restart = "always";
        RestartSec = "10";
      };
    };
  });
in
{
  environment.systemPackages =
    with pkgs;
    [
      cloud-utils # for cloud-localds
      qemu-utils # for qemu-img
    ]
    ++ lib.forEach currentHostsVMs (vm: vm.execStart);

  assertions = [
    {
      assertion =
        !(!config.networking.doctor-bridge.enable && (lib.any (vm: vm.uses-doctor-bridge) currentHostsVMs));
      message = "config.networking.doctor-bridge must be enabled for ${config.networking.hostName} because there is a VM using it";
    }
  ];

  # add all services from the services list to the systemd.services attrset
  systemd.services = lib.foldr (services: service: services // service) { } services;
}
