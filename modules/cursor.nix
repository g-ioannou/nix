{ config, lib, pkgs, ... }: {
  options.features.cursor.enable = lib.mkEnableOption "cursor theme";

  config = lib.mkIf config.features.cursor.enable {
    home.packages = [ pkgs.rose-pine-hyprcursor ];

    home.pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
