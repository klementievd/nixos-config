{ config, pkgs, inputs, lib, ... } @ args:

{
  imports = [./hardware-configuration.nix];
  
  boot = {
    kernelModules = ["acpi_call" "amdgpu" "amd_pstate"];
    
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    
    kernelParams = [
      "nvme_core.default_ps_max_latency_us=0"
    ];
    
    loader = {
      #grub = {
      #  enable = true;
      #  efiSupport = true;
      #  useOSProber = true;
      #  device = "nodev";
      #};
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      systemd-boot = {
        enable = true;
      };
      #systemd-boot.enable = lib.mkForce false;
    };
  };
  
  environment.systemPackages = [
    config.boot.kernelPackages.cpupower
    pkgs.sbctl
  ];

  hardware = {
    bluetooth = {
      enable = true;
      # battery info support
      package = pkgs.bluez5-experimental;
      settings = {
        # make Xbox Series X controller work
        General = {
          Class = "0x000100";
          ControllerMode = "bredr";
          FastConnectable = true;
          JustWorksRepairing = "always";
          Privacy = "device";
          Experimental = true;
        };
      };
    };

    # smooth backlight control
    brillo.enable = true;

    cpu.amd.updateMicrocode = true;

    enableRedistributableFirmware = true;

    opentabletdriver.enable = true;

    xpadneo.enable = true;
  };
  
  networking = {
    hostName = "laptop";
    firewall = {
      allowedTCPPorts = [42355];
      allowedUDPPorts = [5353];
    };
  };
  
  programs = {
    hyprland = {
      enable = true;
      xwayland.hidpi = false;
    };
    
    steam.enable = true;
  };
  
  security = {
    tpm2 = {
      enable = true;
      abrmd.enable = true;
    };
  };
  
  services = {
    fstrim.enable = true;
    
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';
    
    pipewire.lowLatency.enable = true;
    
    xserver.displayManager.sessionPackages = [
      inputs.hyprland.packages.${pkgs.hostPlatform.system}.default
    ];
  };
}
