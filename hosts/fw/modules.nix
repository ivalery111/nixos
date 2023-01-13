{ config, lib, pkgs, ... }: {

  programs.home-manager.enable = true;
  home.username = "valery";
  home.homeDirectory = "/home/valery";

  home.packages = with pkgs; [
    neofetch
    firefox
    qbittorrent
    vlc
    feh
    obsidian
    arandr
  ];

  home.stateVersion = "22.11";
}
