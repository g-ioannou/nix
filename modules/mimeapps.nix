{ config, lib, pkgs, ... }:
{
  options.features.mimeapps.enable = lib.mkEnableOption "mimeapps default applications";

  config = lib.mkIf config.features.mimeapps.enable {
    home.activation.updateDesktopDatabase = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.desktop-file-utils}/bin/update-desktop-database \
        /etc/profiles/per-user/$USER/share/applications \
        2>/dev/null || true
      ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 2>/dev/null || true
    '';

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        # Browser
        "text/html"                        = [ "zen-beta.desktop" ];
        "x-scheme-handler/http"            = [ "zen-beta.desktop" ];
        "x-scheme-handler/https"           = [ "zen-beta.desktop" ];

        # Office
        "application/msword"                                          = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.ms-excel"                                    = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.ms-powerpoint"                               = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"   = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"         = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.oasis.opendocument.text"                     = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.oasis.opendocument.spreadsheet"              = [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.oasis.opendocument.presentation"             = [ "onlyoffice-desktopeditors.desktop" ];
      };
    };
  };
}
