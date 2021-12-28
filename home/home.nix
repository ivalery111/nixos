{ config, lib, pkgs, ... }:
{

  programs.home-manager.enable = true;
  home.username = "valery";
  home.homeDirectory = "/home/valery";

  imports = [
    ./wm/i3/default.nix
    ./wm/launcher/rofi/default.nix
    ./wm/i3/i3status-rust/default.nix

    ./terminal/alacritty/default.nix
    ./terminal/urxvt/default.nix
    ./terminal/shell/promt/starship/default.nix
    ./terminal/shell/fish/default.nix

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
