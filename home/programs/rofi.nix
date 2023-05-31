{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
  };

  xdg.configFile."rofi" = {
    source = ./rofi;
    recursive = true;
  };
}
