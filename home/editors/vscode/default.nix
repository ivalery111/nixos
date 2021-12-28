{ config, pkgs, ... }:
{

  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'";
      "nixEnvSelector.nixFile" = "\${workspaceRoot}\/default.nix";
      "terminal.integrated.fontFamily" = "MesloLGL Nerd Font";
      "terminal.integrated.fontSize" = "14";
    };

    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-python.python
      ms-python.vscode-pylance
      ms-vscode-remote.remote-ssh
      ms-azuretools.vscode-docker

      haskell.haskell
      justusadam.language-haskell

      vadimcn.vscode-lldb

      bbenoist.nix
      arrterian.nix-env-selector
      brettm12345.nixfmt-vscode

      yzhang.markdown-all-in-one

      eamodio.gitlens

      vincaslt.highlight-matching-tag

      esbenp.prettier-vscode

      arcticicestudio.nord-visual-studio-code
      mskelton.one-dark-theme
    ];
  };

}
