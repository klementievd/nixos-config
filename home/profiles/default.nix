{ inputs, withSystem, module_args, ... }:

let
  sharedModules = [
    ../.
    ../shell
    module_args
  ];
  
  homeImports = {
    "klementievd@laptop" =
      [
        ./laptop
        inputs.doom-emacs.hmModule
      ]
      ++ sharedModules;
  };
  
  inherit (inputs.hm.lib) homeManagerConfiguration;
in
{
  imports = [
    {_module.args = {inherit homeImports;};}
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
      "klementievd@laptop" = homeManagerConfiguration {
        modules = homeImports."klementievd@laptop" ++ module_args;
        inherit pkgs;
      };
    });
  };
}
