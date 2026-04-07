{ config, lib, pkgs, ... }: {
  options.features.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf config.features.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    xdg.configFile."nvim".source =
      config.lib.file.mkOutOfStoreSymlink "/home/george/.nixos-dotfiles/configs/nvim";
  };
}
