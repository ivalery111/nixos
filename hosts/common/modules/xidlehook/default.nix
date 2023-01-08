{ pkgs, ...}:
{
  home-manager.users.valery.services.xidlehook = {
    enable = true;
  };

  # Set xidlehook config
  # home-manager.users.valery.xdg.configFile."betterlockscreen/betterlockscreenrc" = {
  #   source = ../../config/betterlockscreen/betterlockscreenrc;
  # };
}
