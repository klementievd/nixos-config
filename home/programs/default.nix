{ pkgs, config, ... }:

{
  imports = [
    ../shell/nix.nix
    ../terminals/alacritty.nix
    ./rofi.nix
    ./cinny.nix
    ./media.nix
    ./git.nix
    ./gtk.nix
    ./packages.nix
    ./qt.nix
    ./xdg.nix
    ./zathura.nix
  ];

  programs = {
    chromium = {
      enable = true;
      commandLineArgs = ["--enable-features=TouchpadOverscrollHistoryNavigation"];
      extensions = [
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
        {id = "bkkmolkhemgaeaeggcmfbghljjjoofoh";}
      ];
    };

    firefox = {
      enable = true;
      profiles.klementievd = {};
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [exts.pass-otp]);
      settings.PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "gnome3";
      sshKeys = ["73D1C4271E8C508E1E55259660C94BE828B07738"];
    };

    syncthing.enable = true;
  };
}
