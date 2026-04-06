{ config, lib, ... }: {
  options.features.starship.enable = lib.mkEnableOption "starship";

  config = lib.mkIf config.features.starship.enable {
    home.file.".config/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship.toml";
    programs.starship.enable = true;
  };
}
