{ config, lib, ... }:
{
  options.features.mimeapps.enable = lib.mkEnableOption "mimeapps default applications";

  config = lib.mkIf config.features.mimeapps.enable {
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
