{ inputs, withSystem, sharedModules, desktopModules, homeImports, ... }:

{
  flake.nixosConfigurations = withSystem "x86_64-linux" ({system, ...}: {
    laptop = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      
      modules =
        [
          ./laptop
          ../modules/xserver.nix
          ../modules/greetd.nix
          ../modules/desktop.nix
          ../modules/gamemode.nix
          {home-manager.users.klementievd.imports = homeImports."klementievd@laptop";}
        ]
        ++ sharedModules
        ++ desktopModules;
    };
  });
}
