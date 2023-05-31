{ inputs, ... }:

{
  services.emacs.enable = true;

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./config;
  };
}