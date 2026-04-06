{ config, lib, noctalia, ... }: {
  imports = [ noctalia.homeModules.default ];

  options.features.noctalia.enable = lib.mkEnableOption "noctalia-shell";

  config = lib.mkIf config.features.noctalia.enable {
    programs.noctalia-shell.enable = true;
  };
}
