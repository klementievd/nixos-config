{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      layout = "us, ru";                              # Keyboard layout & €-sign
      xkbOptions = "grp:win_space_toggle";
      libinput.enable = true;
      modules = [ pkgs.xf86_input_wacom ];        # Both needed for wacom tablet usage
      wacom.enable = true;

      displayManager = {
        sddm.enable = true;          # Display Manager
        defaultSession = "plasmawayland";
      };
      desktopManager.plasma5 = {
        enable = true;                            # Desktop Manager
        excludePackages = with pkgs.libsForQt5; [
          elisa
          khelpcenter
          konsole
          oxygen
        ];
      };
    };
  };
}
