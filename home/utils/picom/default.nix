{config, pkgs, ... }:
{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;
    refreshRate = 0;

    activeOpacity = "3.0";
    blur = true;

    extraOptions=
      ''
unredir-if-possible = false;
      '';
  };
}
