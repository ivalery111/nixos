{ pkgs, ...}:
{
  home-manager.users.valery.programs.git = {
    enable = true;
  };

  # Set alacritty config
  #home-manager.users.valery.xdg.configFile.".gitconfig" = {
  #  source = ../../config/git/config;
  #};

  home-manager.users.valery.home.file.".gitconfig" = {
    source = ../../config/git/config;
  };
}
