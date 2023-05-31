
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # we need git for flakes
  environment.systemPackages = [pkgs.git];

  nix = {
    # extra builders to offload work onto
    # don't set a machine as a builder to itself (throws warnings)
    buildMachines = lib.filter (x: x.hostName != config.networking.hostName) [
      {
        system = "aarch64-linux";
        sshUser = "root";
        sshKey = "/etc/ssh/ssh_host_ed25519_key";
        maxJobs = 4;
        hostName = "arm-server";
        supportedFeatures = ["nixos-test" "benchmark" "kvm" "big-parallel"];
      }
    ];
    distributedBuilds = true;

    # auto garbage collect
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      trusted-users = ["root" "@wheel"];
    };
  };
}