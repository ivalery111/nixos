{ config, pkgs, ...}:
{
  programs.vscode = {
    enable = true;

    extensions = [
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.llvm-vs-code-extensions.vscode-clangd
      pkgs.vscode-extensions.xaver.clang-format
      pkgs.vscode-extensions.twxs.cmake
      pkgs.vscode-extensions.timonwong.shellcheck
      pkgs.vscode-extensions.mkhl.direnv
      pkgs.vscode-extensions.eamodio.gitlens
    ];
  };
}
