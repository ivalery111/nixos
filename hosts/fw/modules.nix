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
    libreoffice-still
    ripgrep
  ];

 imports = [
    ./modules/vscode/vscode.nix
    ./modules/direnv
  ];

  home.stateVersion = "22.11";
}
