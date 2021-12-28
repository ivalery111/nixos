{ config, lib, pkgs, ... }:
{

  programs.zsh = {
    enable = true;


    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zsh-autosuggestions"];
      theme = "robbyrussell";
    };

    plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.7.0";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    ];
  };

}
