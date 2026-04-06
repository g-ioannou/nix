{ inputs, ... }:
let
  users = [ "george" ];
  lib = inputs.nixpkgs.lib;
  homeModules = lib.mapAttrs'
    (file: _: lib.nameValuePair (lib.removeSuffix ".nix" file) (import ../../modules/${file}))
    (builtins.readDir ../../modules);
in
{
  flake.nixosConfigurations.truck = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
      {
        nixpkgs.overlays = [
          inputs.claude-code.overlays.default
        ];
      }
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = {
            inherit (inputs) claude-code noctalia;
            inherit homeModules;
          };
          users.george = { ... }: {
            imports = [ homeModules.hyprland ];
            features.hyprland.enable = true;
          };
        };
      }
    ] ++ map (user: ../../users/${user}) users;
  };
}
