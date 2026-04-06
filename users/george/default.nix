{ pkgs, ... }: {
  users.users.george = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "uinput" ];
    packages = with pkgs; [
      tree
      vim
      neovim
      wget
      kitty

      ghostty
      wl-clipboard
      #claude-code
    ];
  };

  home-manager.users.george = import ./home.nix;
}
