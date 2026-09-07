# Dotfiles

Personal Linux desktop configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

Each top-level directory is a Stow package:

- `btop` - system monitor configuration
- `hypr` - Hyprland, Hyprlock, wallpaper, keybind, and utility configuration
- `kitty` - Kitty terminal configuration
- `swayosd` - on-screen display configuration
- `waybar` - Waybar configuration and styling

## How Stow Is Used

This repository is kept in `~/.dotfiles`. A package mirrors the path where its files should live under `$HOME`. For example:

```text
hypr/.config/hypr/hyprlock.conf
```

is linked by Stow to:

```text
~/.config/hypr/hyprlock.conf
```

Stow creates symlinks instead of copying files, so edits made through either the repository path or the deployed path update the same configuration.

## Installing Configurations

Install one package from the repository root:

```bash
cd ~/.dotfiles
stow hypr
```

Install all packages:

```bash
cd ~/.dotfiles
stow */
```

If a destination already exists, inspect it before using `--adopt`. That option moves existing files into the Stow package before creating symlinks:

```bash
stow --adopt hypr
```

Review the resulting changes before committing them.

## Updating Configurations

After changing files in this repository, the symlinked configuration is already updated. To recreate links or apply package changes, restow the package:

```bash
cd ~/.dotfiles
stow -R hypr
```

Remove a package's symlinks with:

```bash
cd ~/.dotfiles
stow -D hypr
```

The `-D` command removes links managed by Stow; it does not remove the package files in this repository.

## Notes

- Run Stow from `~/.dotfiles` so the package directories are resolved correctly.
- Back up existing configuration files before adopting them into the repository.
- Programs referenced by the configurations must be installed separately, such as Hyprland, Hyprlock, `awww`, Waybar, Kitty, `swayosd`, and `btop`.
- Screenshot and clipboard history support requires `grim`, `slurp`, `wl-clipboard`, and `cliphist`.

## Credits

- [Tokyo Night VS Code Theme](https://github.com/tokyo-night/tokyo-night-vscode-theme) - Tokyo Night color inspiration.
- [maxhu08/dotfiles](https://github.com/maxhu08/dotfiles) - inspiration for the Hyprland, Hyprlock, `awww`, and Waybar setup.
