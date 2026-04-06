{ config, lib, ... }: {
  options.features.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf config.features.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "github.com" = {
          user = "git";
          identityFile = "~/.ssh/github";
        };
      };
    };
  };
}
