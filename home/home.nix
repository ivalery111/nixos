{ config, lib, pkgs, ... }:
{

  programs.home-manager.enable = true;
  home.username = "valery";
  home.homeDirectory = "/home/valery";

  imports = [
    ./terminal/foot/default.nix

    ./editors/neovim/default.nix
    ./editors/vscode/default.nix

    ./utils/direnv/default.nix
    ./utils/betterlockscreen/default.nix
    ./utils/xidlehook/default.nix
    ./utils/git/default.nix
    ./utils/redshift/default.nix
    ./utils/autorandr/default.nix
    ./utils/picom/default.nix
    ./utils/fzf/default.nix

    ./packages.nix
  ];


  home.stateVersion = "21.11";

}
