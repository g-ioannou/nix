{ config, lib, pkgs, zen-browser, firefox-addons, ... }: {
  imports = [ zen-browser.homeModules.beta ];

  options.features.zen-browser.enable = lib.mkEnableOption "zen browser";

  config = lib.mkIf config.features.zen-browser.enable {
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      nativeMessagingHosts = [ ];

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };

      profiles.default = {
        extensions.packages = with firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          bitwarden
          vimium-c
        ];
        mods = [ ];

        search = {
          force = true;
          default = "google";
          engines = {
            nixpkgs = {
              name = "nixpkgs";
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nx"];
              urls = [
                {
                  template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
                }
              ];
            };
          };
        };

        settings = {
          # Enable userChrome.css (required for noctalia templates)
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          # Force dark mode for browser UI and web content
          "ui.systemUsesDarkTheme" = 1;
          "layout.css.prefers-color-scheme.content-override" = 0;
        };

        bookmarks = {
          force = true;
          settings = [ ];
        };

        spacesForce = false;
        spaces = { };
      };
    };
  };
}
