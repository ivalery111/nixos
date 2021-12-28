{ config, pkgs, ... }:
{

  services.xidlehook = {
    enable = true;

    not-when-audio = true;
    not-when-fullscreen = true;

    timers = [
    {
      delay = 120;
      command = "betterlockscreen -l dim";
    }
    {
      delay = 900;
      command = "systemctl suspend";
    }
    ];
  };

}
