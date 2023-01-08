{ pkgs, ...}:
{
  home-manager.users.valery.programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
  };

  # Set alacritty config
  #home-manager.users.valery.xdg.configFile.".gitconfig" = {
  #  source = ../../config/git/config;
  #};

  home-manager.users.valery.home.file.".gitconfig" = {
    source = ../../config/git/config;
  };
}
