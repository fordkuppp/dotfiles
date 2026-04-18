# dotfiles

**Disclaimer:** Configs itself is (mostly) editted by human, the rest AI. Also, some config copied from [end4's dots](https://github.com/end-4/dots-hyprland)

## What's managed by Nix

| Module       | What it does                          |
|--------------|---------------------------------------|
| `fish.nix`   | Fish shell, plugins, aliases, PATH    |
| `kitty.nix`  | Kitty terminal (nixGL wrapped)        |
| `neovim.nix` | Neovim + kickstart config             |
| `zellij.nix` | Zellij multiplexer + layouts          |
| `niri.nix`   | Niri compositor + config              |

## What's managed by AUR

| Package              | Why not Nix                          |
|----------------------|--------------------------------------|
| dank-material-shell  | Needs system PAM + GPU drivers       |

## Usage

After editing any config:

```bash
mise run switch
```
