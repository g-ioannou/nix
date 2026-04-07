{ config, lib, pkgs, ... }: {
  options.features.dolphin.enable = lib.mkEnableOption "dolphin file manager";

  config = lib.mkIf config.features.dolphin.enable {
    home.packages = with pkgs; [
      kdePackages.dolphin
    ];
  };
}
