{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # for flipper zero
    qFlipper

    # messaging
    tdesktop
    discord

    # torrents
    transmission-remote-gtk

    # misc
    libnotify
    xdg-utils

    # productivity
    obsidian
    xournalpp

    # office programs
    okular # So cool PDF Viewer

    # disks/file management
    gnome.nautilus

    # other
    neofetch
    python39
    ripgrep
    jc
  ];
}
