{ pkgs, ...}:
{
  home-manager.users.valery.programs.rofi = {
    enable = true;
    configPath = "$XDG_CONFIG_HOME/rofi/config.rasi";
  };

  # Set rofi config
  home-manager.users.valery.xdg.configFile."rofi/config.rasi" = {
    source = ../../config/rofi/config.rasi;
  };
}
