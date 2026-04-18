{ config, pkgs, ... }:

{
  xdg.configFile."kitty/search.py".source = ./kitty/search.py;
  xdg.configFile."kitty/scroll_mark.py".source = ./kitty/scroll_mark.py;

  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 11.0;
    };

    themeFile = "Catppuccin-Macchiato";

    settings = {
      cursor_shape = "beam";
      cursor_trail = 0;
      window_margin_width = "21.75";
      confirm_os_window_close = 0;
      shell = "fish";
    };

    extraConfig = ''
      # DankMaterialShell Theme
      include dank-tabs.conf
      include dank-theme.conf

      # Copy
      map ctrl+c    copy_or_interrupt

      # Search
      map ctrl+f   launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id
      map kitty_mod+f   launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id

      # Scroll & Zoom
      map page_up    scroll_page_up
      map page_down    scroll_page_down

      map ctrl+plus  change_font_size all +1
      map ctrl+equal  change_font_size all +1
      map ctrl+kp_add  change_font_size all +1
      map ctrl+minus       change_font_size all -1
      map ctrl+underscore       change_font_size all -1
      map ctrl+kp_subtract       change_font_size all -1
      map ctrl+0 change_font_size all 0
      map ctrl+kp_0 change_font_size all 0
    '';
  };
}
