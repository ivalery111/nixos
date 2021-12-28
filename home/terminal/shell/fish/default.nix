{ config, lib, pkgs, ... }:
{

  programs.fish = {
    enable = true;

    # shellInit = "starship init fish | source";

    plugins = [{
      name = "fisher";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "fisher";
        rev = "4.3.0";
        sha256 = "11qzyi6nksaxp8a8mplp8f77zzjcjz8grhbscvrcg870n5xj88z2";
      };
    }];
  };

}
