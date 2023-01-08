{ pkgs, ...}:
{
  home-manager.users.valery.services.dunst = {
    enable = true;
  };

  # Set dunst config
  home-manager.users.valery.xdg.configFile."dunst/dunstrc" = {
    source = ../../config/dunst/dunstrc;
  };
}
