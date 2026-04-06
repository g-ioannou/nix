{ config, lib, pkgs, ... }: {
  options.features.bitwarden.enable = lib.mkEnableOption "Bitwarden password manager";

  config = lib.mkIf config.features.bitwarden.enable {
    home.packages = [ pkgs.bitwarden-desktop ];

    home.sessionVariables = {
      SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
    };
  };
}
