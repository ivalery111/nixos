{ pkgs, ... }:
{
  vim-ripgrep = pkgs.vimUtils.buildVimPlugin {
    name = "vim-ripgrep";
    src = pkgs.fetchFromGitHub {
      owner = "jremmen";
      repo = "vim-ripgrep";
      rev = "2bb2425387b449a0cd65a54ceb85e123d7a320b8";
      sha256 = "0vzdi1q6xh440mvlgsi08d6py8n7ac2yhgixpcs74f4p9160zx1s";
    };
  };
}

