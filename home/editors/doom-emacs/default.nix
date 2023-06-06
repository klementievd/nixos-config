{ inputs, ... }:

{
  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
  };

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./config;
  };
}
