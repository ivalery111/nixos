{ config, lib, pkgs, ... }:
{

  programs.git = {
    enable = true;

    userEmail = "ivalery111@gmail.com";
    userName = "Valery Ivanov";
  };

}
