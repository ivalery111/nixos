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
  ];

  #services.xserver.enable = true;
  #services.xserver.autorun = true;
  #services.xserver.layout = "us";
  ##services.xserver.desktopManager.xterm.enable = false;
  ##services.xserver.displayManager.defaultSession = "xfce";
  ##services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.displayManager.defaultSession = "xfce";
  #services.xserver.windowManager.i3.enable = true;

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;   

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = false;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    displayManager = {
      sddm = {
        enable = true;
      };
      defaultSession = "none+i3";
    };

    windowManager.i3.enable = true;
  };

  # Set i3 config
  home-manager.users.valery.xdg.configFile."i3/config" = {
    source = ../../../config/i3/config;
  };

  home-manager.users.valery.home.file."i3/scripts" = {
    source = ../../../config/i3/scripts;
  };
}
