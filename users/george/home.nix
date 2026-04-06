{ pkgs, lib, homeModules, ... }:

{

  home.username = "george";
  home.homeDirectory = "/home/george";

  home.stateVersion = "25.11";


  home.packages = with pkgs; [
    claude-code
    brightnessctl
    imagemagick
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
  ];

  features = lib.genAttrs [ "starship" "git" "ssh" "zsh" "noctalia" "cursor" "kanata" "zoxide" "bitwarden" ] (_: { enable = true; });
}
