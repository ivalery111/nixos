{ pkgs, ... }:
{
  home.packages = with pkgs; [

    virt-manager
    virtualenv
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
    python39Packages.pip

    calibre
    qpdf

    arandr
    wlsunset
  ];

}
