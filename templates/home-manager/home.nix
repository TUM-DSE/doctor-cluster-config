# docs: find home manager options here:
# https://nix-community.github.io/home-manager/options.html
{ pkgs, ... }: {
  config = {
    home.packages = with pkgs; [
      # put user-global packages here
      htop
    ];
  };
}
