{pkgs, ...}: {
  systemd.services.ssh-announce = {
    description = "irc announce ssh";
    after = ["network-online.target"];
    wantedBy = ["multi-user.target"];
    script = ''
      set -efu
      ${pkgs.nur.repos.mic92.untilport}/bin/untilport irc.freenode.org 6667 && \
      ${pkgs.nur.repos.mic92.irc-announce}/bin/irc-announce \
        irc.freenode.org 6667 install-image "#krebs-announce" \
        "SSH Service at $(ip  -br a)"
    '';
    serviceConfig.Type = "oneshot";
  };
}
