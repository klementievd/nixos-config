{
  imports = [
    ../../editors/doom-emacs
    ../../programs
    ../../wayland
    ../../terminals/alacritty.nix
  ];
  
  home.sessionVariables = {
    GDK_SCALE = "2";
  };
}
