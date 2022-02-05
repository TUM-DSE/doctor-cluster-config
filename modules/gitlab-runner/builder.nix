{
  users.extraUsers.gitlab-builder = {
    isNormalUser = true;
    home = "/var/lib/gitlab-builder";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/yryxd93+2KkqhCaJIjXf48jPre3HnHyvHz/aQPlHt"
    ];
    uid = 5003;
  };
  nix.settings.trusted-users = [ "gitlab-builder" ];
}
