{ config, lib, osConfig, ... }: {
  options.features.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf config.features.zsh.enable {
    programs.zsh = {
      enable = true;
      autocd = true;
      history = {
        size = 10000;
        save = 10000;
        path = "${config.home.homeDirectory}/.zsh_history";
        ignoreDups = true;
        ignoreSpace = true;
        share = true;
        extended = false;
        expireDuplicatesFirst = false;
        ignoreAllDups = false;
        findNoDups = false;
        append = false;
      };
      initContent = ''
        setopt HIST_FCNTL_LOCK
        if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec start-hyprland
        fi
      '';
      shellAliases = {
        update = "sudo nixos-rebuild switch --flake path:${config.home.homeDirectory}/.nixos-dotfiles#${osConfig.networking.hostName}";
        hi = "echo 'hello!'";
        kanata-reload = "pkill kanata; kanata --cfg ~/.config/kanata/kanata.kbd &";
      };
    };
  };
}
