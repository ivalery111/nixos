{ pkgs, ...}:
{
  home-manager.users.valery.programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
  };

  home-manager.users.valery.home.file.".gitconfig" = {
    source = ../../config/git/config;
  };
}
