{ config, pkgs, inputs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      jost
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      inputs.self.packages.${pkgs.hostPlatform.system}.silkscreen

      # nerdfonts
      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    ];

    # use fonts specified by user rather than default ones
    enableDefaultFonts = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  # enable location service
  location.provider = "geoclue2";

  networking = {
    firewall = {
      # for Rocket League
      allowedTCPPortRanges = [
        {
          from = 27015;
          to = 27030;
        }
        {
          from = 27036;
          to = 27037;
        }
      ];
      allowedUDPPorts = [4380 27036 34197];
      allowedUDPPortRanges = [
        {
          from = 7000;
          to = 9000;
        }
        {
          from = 27000;
          to = 27031;
        }
      ];

      # Spotify track sync with other devices
      allowedTCPPorts = [57621];
    };
  };

  nix = {
    # package = inputs.nix-super.packages.${pkgs.hostPlatform.system}.nix;
    settings = {};
  };

  # make HM-managed GTK stuff work
  programs.dconf.enable = true;

  services = {
    # use Ambient Light Sensors for auto brightness adjustment
    clight = {
      enable = true;
      settings = {
        verbose = true;
        dpms.timeouts = [900 300];
        dimmer.timeouts = [870 270];
        screen.disabled = true;
      };
    };

    # provide location
    geoclue2.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };

    # battery info & stuff
    upower.enable = true;
  };

  security = {
    # allow wayland lockers to unlock the screen
    pam.services.swaylock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.libsForQt5.xdg-desktop-portal-kde];
  };
}
