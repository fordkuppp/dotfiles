{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };

  xdg.configFile."starship.toml".source = ./starship.toml;
}
