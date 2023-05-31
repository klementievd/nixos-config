{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    thefuck
    exa
  ];
  
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      code = "$HOME/Documents/code";
      dots = "$HOME/Documents/code/dotfiles";
      pics = "$HOME/Pictures";
      vids = "$HOME/Videos";
      nixpkgs = "$HOME/Documents/code/git/nixpkgs";
    };
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    initExtra = ''
      eval "$(starship init zsh)"
    '';

    shellAliases = {
      update = "sudo nixos-rebuild switch";
      grep = "grep --color";
      ip = "ip --color";
      l = "exa -l";
      la = "exa -la";
      md = "mkdir -p";

      us = "systemctl --user";
      rs = "sudo systemctl";
    };
    shellGlobalAliases = {exa = "exa --icons --git";};
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
      ];
      theme = "robbyrussell";
    };
  };
}
