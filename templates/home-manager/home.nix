# docs: find home manager options here:
# https://nix-community.github.io/home-manager/options.html
{ pkgs, username, ... }: {
  config = {
    home.packages = with pkgs; [
      # put user-global packages here
      htop
    ];

    home.stateVersion = "23.11";
    home.username = username;
    home.homeDirectory = "/home/${username}";
  };
}
