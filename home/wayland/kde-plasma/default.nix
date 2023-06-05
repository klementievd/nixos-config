{ config, lib, pkgs, ... }:

{
  programs = {
    kdeconnect = {                                # For GSConnect
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };

  home = {
    packages = with pkgs.libsForQt5; [                 # Packages installed
      packagekit-qt
      bismuth
    ];
  };
}
