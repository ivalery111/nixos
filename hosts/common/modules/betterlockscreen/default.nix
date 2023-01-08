{ pkgs, ...}:
{
  home-manager.users.valery.services.betterlockscreen = {
    enable = true;
  };

  # Set alacritty config
  home-manager.users.valery.xdg.configFile."betterlockscreen/betterlockscreenrc" = {
    source = ../../config/betterlockscreen/betterlockscreenrc;
  };
}
