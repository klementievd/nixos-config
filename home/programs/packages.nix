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

    # file management
    gnome.nautilus

    # other
    python39
    ripgrep
    jc
  ];
}
