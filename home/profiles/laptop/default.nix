{
  imports = [
    ../../editors/doom-emacs
    ../../programs
    ../../programs/dunst.nix
    ../../wayland
    ../../terminals/alacritty.nix
  ];
  
  home.sessionVariables = {
    GDK_SCALE = "2";
  };

  wayland.windowManager.hyprland.xwayland.hidpi = false;
}
