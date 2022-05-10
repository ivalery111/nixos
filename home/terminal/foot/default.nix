{ config, lib, pkgs, ... }:
{

  programs.foot = {
    enable = true;
  };

  # TODO: use $HOME environment variable
  xdg.configFile."foot/foot.ini".source = /home/valery/nixos/home/terminal/foot/foot.ini;
}
