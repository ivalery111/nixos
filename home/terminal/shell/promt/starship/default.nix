{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;

    enableFishIntegration = true;

    settings = {
      format="$all";

      add_newline = false;

      directory = {
        truncation_length = 3;
        truncation_symbol = "../";
      };

      fill = {
        symbol = "-";
        style = "bold green";
      };
    };
  };
}
