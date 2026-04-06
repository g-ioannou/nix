{ config, lib, ... }: {
  options.features.zoxide.enable = lib.mkEnableOption "zoxide";

  config = lib.mkIf config.features.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd" "cd" ];
    };
  };
}
