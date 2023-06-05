{ config, lib, pkgs, ... }:

{
  services = {
    kdeconnect = {
      enable = true;
    };
  };

  home = {
    packages = with pkgs.libsForQt5; [
      packagekit-qt
      bismuth
    ];
  };
}
