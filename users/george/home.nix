{ pkgs, lib, homeModules, hostName, ... }:

{

  home.username = "george";
  home.homeDirectory = "/home/george";

  home.stateVersion = "25.11";


  xsession.numlock.enable = true;
  home.packages = with pkgs; [
    claude-code
    brightnessctl
    imagemagick
  ] ++ lib.optionals (hostName == "truck") [
    onlyoffice-desktopeditors
  ];

  imports = with homeModules; [
    starship
    git
    ssh
    zsh
    noctalia
    cursor
    kanata
    zoxide
    bitwarden
    zen-browser
    dolphin
    codex
  ];

  features = {
    starship.enable = true;
    git.enable = true;
    ssh.enable = true;
    zsh.enable = true;
    cursor.enable = true;
    zoxide.enable = true;
    bitwarden.enable = true;
    zen-browser.enable = true;
    codex.enable = true;
    kanata.enable = true;

    dolphin.enable = hostName == "truck";
    noctalia.enable = hostName == "truck";
  };
}
