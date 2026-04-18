{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  xdg.configFile."nvim" = {
    source = builtins.filterSource
      (path: type: baseNameOf path != "lazy-lock.json")
      ./nvim;
    recursive = true;
  };
}
