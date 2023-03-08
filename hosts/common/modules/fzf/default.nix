{ pkgs, ...}:
{
  home-manager.users.valery.programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration  = true;
  };
}
