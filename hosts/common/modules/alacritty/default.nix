{ pkgs, ...}:
{
  home-manager.users.valery.programs.alacritty = {
    enable = true;
  };

  # Set alacritty config
  home-manager.users.valery.xdg.configFile."alacritty/alacritty.yml" = {
    source = ../../config/alacritty/alacritty.yml;
  };
}
