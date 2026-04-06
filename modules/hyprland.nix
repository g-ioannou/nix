{ config, lib, ... }: {
  options.features.hyprland.enable = lib.mkEnableOption "hyprland window manager";

  config = lib.mkIf config.features.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
    };

    xdg.configFile."hypr/hyprland.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos-dotfiles/configs/hyprland.conf";
  };
}
