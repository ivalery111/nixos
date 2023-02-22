{ pkgs, ...}:
{
  home-manager.users.valery.services.polybar = {
    enable = true;
    script = '''';
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  };

  # Set polybar config
  home-manager.users.valery.xdg.configFile."polybar/config.ini" = {
    source = ../../config/polybar/config.ini;
  };

  # Set polybar launcher script
  home-manager.users.valery.xdg.configFile."polybar/launch.sh" = {
    source = ../../config/polybar/launch.sh;
    # executable = true;
  };

  # Set custom wireguard script
  home-manager.users.valery.xdg.configFile."polybar/scripts/custom-wireguard.sh" = {
    source = ../../config/polybar/scripts/custom-wireguard.sh;
    executable = true;
  };
}
