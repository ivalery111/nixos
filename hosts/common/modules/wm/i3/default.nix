{ config, pkgs, ... }: {

  imports = [
    ../../polybar
    ../../alacritty
    ../../vscode
    ../../zsh
    ../../neovim
    ../../picom
    ../../git
    ../../dunst
    ../../redshift
    ../../thunar
  ];

  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.layout = "us,ru";
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # Set i3 config
  home-manager.users.valery.xdg.configFile."i3/config" = {
    source = ../../../config/i3/config;
  };
}
