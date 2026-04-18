{ config, pkgs, ... }:

{
  home.username = "fordkuppp";
  home.homeDirectory = "/home/fordkuppp";

  # Packages managed by home-manager
  home.packages = with pkgs; [
    # Add packages here as you migrate them from pacman/yay
    # Example:
    # waybar
    # wofi
    # dunst
  ];

  # Import modular configs
  imports = [
    ./modules/kitty.nix
    ./modules/fish.nix
    ./modules/neovim.nix
    ./modules/zellij.nix
    ./modules/niri.nix
    ./modules/yazi.nix
    ./modules/starship.nix
  ];

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # This should match the home-manager version you're using
  home.stateVersion = "24.11";
}
