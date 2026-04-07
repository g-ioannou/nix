{ config, lib, pkgs, ... }: {
  options.features.codex.enable = lib.mkEnableOption "codex AI coding agent";

  config = lib.mkIf config.features.codex.enable {
    home.packages = [ pkgs.codex ];
  };
}
