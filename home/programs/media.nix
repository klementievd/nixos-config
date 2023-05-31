{ pkgs, config, ... }:

# media - control and enjoy audio/video
{
  imports = [
    ./rnnoise.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer
    # images
    imv
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };

    obs-studio.enable = true;
  };

  services = {
    playerctld.enable = true;

    udiskie.enable = true;
  };
}