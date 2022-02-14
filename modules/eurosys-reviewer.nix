{ config, lib, pkgs, ... }:

{
  users.users.reviewer = {
    isNormalUser = true;
    group = "users";
    home = "/scratch/reviewer";
    uid = 4001;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCNKi5/EwjJhW827IuCOmPI7AclIr0QmH7q3SSwj8MF aec-key"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCv+Mt+wQuD3hcsOSCgbIb2n0gKSqT9R4OQ/j5iClZaYAC6uzlYMQ7TCcXXV4kvG4A1UFpBFIxbcNc7fuLCump2Umezzl8kl5IoTFxTU7GgRruyhxYDAglnE1HobX83qtlkzaMQ4U9xVphik3T/EtbQRWABrIHwMKyJtpcWLyKPginQkt+AelXQ6M5Rw5dOhVV+gSLkIbbc8Rnu3CNCurkMfkJclppWIWjvXDT0OoUzlSfBgrBIhGOXc+/wR+lcyU6TJObX08z7B3M/afXPtBMNK75J5WR/XQG6TKWmC7fZgsIlnSBFEULFlmrrUIKp89IRbpryOnHtowei71h9pxfj mark-lee@mac-air"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICkWqC4QyrcoJoZzQfk3agvQyZBeO/+Rq2PES+gLhNpe eurosys-aec"

      # my own key for testing
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbBp2dH2X3dcU1zh+xW3ZsdYROKpJd3n13ssOP092qE joerg@turingmachine"
    ];
  };
}
