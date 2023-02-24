{ pkgs, ...}:
{
  home-manager.users.valery.programs.kitty = {
    enable = true;
  };

  # Set kitty config
  home-manager.users.valery.xdg.configFile."kitty/kitty.conf" = {
    source = ../../config/kitty/kitty.conf;
  };
}
