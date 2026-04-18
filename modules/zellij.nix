{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/layouts/dev.kdl".text = ''
    layout {
      pane split_direction="vertical" {
        pane command="nvim" size="60%"
        pane split_direction="horizontal" {
          pane
          pane command="claude"
        }
      }
    }
  '';
}
