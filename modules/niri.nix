{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  xdg.configFile."niri/config.kdl" = {
    source = ./niri/config.kdl;
  };
}
