{ config, lib, pkgs, ... }: {

  programs.home-manager.enable = true;
  home.username = "valery";
  home.homeDirectory = "/home/valery";

  home.stateVersion = "22.11";
}
