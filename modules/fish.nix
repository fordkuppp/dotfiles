{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # No greeting
      set fish_greeting

      # Editor
      if test -n "$SSH_CONNECTION"
          set -gx EDITOR vim
      else
          set -gx EDITOR nvim
      end

      # Tool integrations
      mise activate fish | source
      atuin init fish --disable-up-arrow | source
      zoxide init --cmd cd fish | source

      # pyenv
      set -gx PYENV_ROOT "$HOME/.pyenv"
      if test -d "$PYENV_ROOT/bin"
          fish_add_path $PYENV_ROOT/bin
      end
      pyenv init - fish | source

      # pkgfile command-not-found
      if test -f /usr/share/doc/pkgfile/command-not-found.fish
          source /usr/share/doc/pkgfile/command-not-found.fish
      end

      # Fish 4.3 migration cleanup
      set --erase --universal fish_key_bindings

      # Colors from quickshell (loaded last to prevent plugins from overriding)
      if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
          cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
      end
    '';

    shellInit = ''
      # Source nix daemon environment
      bass source /etc/profile.d/nix-daemon.sh

      # nvm-fish integration
      load_nvm > /dev/stderr
    '';

    shellAliases = {
      tg = "terragrunt";
      k8s = "kubectl";
      vim = "nvim";
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
      celar = "printf '\\033[2J\\033[3J\\033[1;1H'";
      claer = "printf '\\033[2J\\033[3J\\033[1;1H'";
      pamcan = "pacman";
      q = "qs -c ii";
    };

    plugins = [
      # bass lets you run bash scripts in fish
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "plugin-sudope";
        src = pkgs.fishPlugins.plugin-sudope.src;
      }
    ];
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.dotnet/tools"
  ];

  # eza alias needs conditional logic, handled in interactiveShellInit
  programs.eza = {
    enable = true;
    icons = "auto";
  };
}
