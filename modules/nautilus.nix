{ config, lib, pkgs, ... }: {
  options.features.nautilus.enable = lib.mkEnableOption "nautilus file manager";

  config = lib.mkIf config.features.nautilus.enable {
    home.packages = with pkgs; [
      nautilus
      tela-circle-icon-theme
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        icon-theme = "Tela-circle-dark";
      };
    };

    home.file.".local/share/nautilus/scripts/open-in-ghostty" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        dir=$(python3 -c "import urllib.parse, sys; print(urllib.parse.unquote(sys.argv[1].removeprefix('file://')))" "$NAUTILUS_SCRIPT_CURRENT_URI")
        ghostty --working-directory="$dir"
      '';
    };

    xdg.configFile."gtk-3.0/bookmarks".text = ''
      file:///home/george/Downloads Downloads
      file:///home/george/Documents Documents
    '';
  };
}
