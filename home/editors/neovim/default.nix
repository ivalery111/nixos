{ config, lib, pkgs, ... }:

{

  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-airline-themes
    ];
  };

}

#==================================================================================
#{ config, lib, pkgs, ... }:
#let
  ##vim-ripgrep = pkgs.vimUtils.buildVimPlugin {
  ##    name = "vim-ripgrep";
  ##    src = pkgs.fetchFromGitHub {
  ##      owner = "jremmen";
  ##      repo = "vim-ripgrep";
  ##      rev = "2bb2425387b449a0cd65a54ceb85e123d7a320b8";
  ##      sha256 = "0vzdi1q6xh440mvlgsi08d6py8n7ac2yhgixpcs74f4p9160zx1s";
  ##    };
  ##};

  #customPlugins = pkgs.callPackage ./custom-plugins.nix {
    #inherit (pkgs.vimUtils) buildVimPlugin;
  #};

  #plugins = pkgs.vimPlugins // customPlugins;

  #overridenPlugins = with pkgs; [];

  #vimPlugins = with plugins; [
    #neomake

    #nerdcommenter
    #nerdtree
    #nerdtree-git-plugin
    #vim-devicons

    #vim-airline
    #vim-airline-themes

    #vimspector

    #fzf-vim
    #vim-ripgrep

    #coc-nvim
    #coc-yank

    #vim-fugitive
    #vim-gitgutter

    #vim-nix

    #nord-vim
    #gruvbox-material
  #] ++ overridenPlugins;

  #baseConfig = builtins.readFile ./config.vim;
  #pluginsConfig = builtins.readFile ./plugins.vim;
  #cocConfig = builtins.readFile ./coc.vim;
  #cocSettings = builtins.toJSON(import ./coc-settings.nix);
  #vimConfig = baseConfig + pluginsConfig + cocConfig;

#in
#{

  #programs.neovim = {
    #enable = true;

    #extraConfig = vimConfig;

    #plugins = vimPlugins;

    #vimAlias = true;
    #viAlias = true;
    #vimdiffAlias = true;

    #withNodeJs = true;
    #withPython3 = true;

  #};

  #xdg.configFile = {
    #"nvim/coc-settings.json".text = cocSettings;
  #};
#}
