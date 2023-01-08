{ pkgs, ...}:
{
  home-manager.users.valery.services.picom = {
    enable = true;
  };

  # Set polybar config
  home-manager.users.valery.xdg.configFile."picom/picom.conf" = {
    source = ../../config/picom/picom.conf;
  };
}
