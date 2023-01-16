{ pkgs, ...}:
{
  home-manager.users.valery.programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git"
      ];
      theme = "simple";
    };
  };
}
