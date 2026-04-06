{ config, lib, pkgs, ... }: {
  options.features.kanata.enable = lib.mkEnableOption "kanata keyboard configurator";

  config = lib.mkIf config.features.kanata.enable {
    home.packages = [ pkgs.kanata ];

    xdg.configFile."kanata/kanata.kbd".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos-dotfiles/configs/kanata.kbd";
  };
}
