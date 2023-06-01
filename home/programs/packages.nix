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

    # torrents
    transmission-remote-gtk

    # misc
    libnotify
    xdg-utils

    # productivity
    obsidian
    xournalpp

    # other
    python39
  ];
}
