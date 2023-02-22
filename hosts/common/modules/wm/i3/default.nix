{ config, pkgs, ... }: {

  imports = [
    # ../../dm/xfce
    ../../polybar
    ../../alacritty
    ../../vscode
    ../../zsh
    ../../neovim
    ../../picom
    ../../git
    ../../dunst
    # ../../redshift
    ../../thunar
    ../../betterlockscreen
    ../../xidlehook
    ../../rofi
    ../../autorandr
    ../../docker
  ];

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;   

    displayManager = {
      sddm = {
        enable = true;
      };
      defaultSession = "none+i3";
    };

    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
  };

  # Set i3 config
  home-manager.users.valery.xdg.configFile."i3/config" = {
    source = ../../../config/i3/config;
  };

  home-manager.users.valery.xdg.configFile."i3/scripts" = {
    source = ../../../config/i3/scripts;
  };
}
