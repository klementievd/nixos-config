{ self, inputs, ... }:

{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      silkscript = pkgs.callPackages ./silkscript {};
    };
  };
}
