{ config, lib, ... }: {
  options.features.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf config.features.git.enable {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
      };
      includes = [
        { path = "~/.gitconfig.local"; }
      ];
    };
  };
}
