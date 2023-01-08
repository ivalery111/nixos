{ pkgs, ...}:
{
  home-manager.users.valery.programs.neovim = {
    enable = true;
  };

  # Set alacritty config
  home-manager.users.valery.xdg.configFile."nvim/init.lua" = {
    source = ../../config/neovim/init.lua;
  };
}
