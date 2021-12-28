{ pkgs, ... }:
{

  home.packages = with pkgs; [
    neofetch

    gcc10
    rnix-lsp
    ccls

    cmake
    gnumake

    fzf
    ripgrep

    nitrogen
    polkit
    vlc
    qbittorrent

    wine-staging

    trilium-desktop
    tdesktop
    obsidian

    python3Full

    calibre
    qpdf
  ];

}
