{ self, inputs, ... }:

{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      silkscreen = pkgs.callPackages ./silkscreen {};
    };
  };
}
