{ pkgs, ... }: {
  # Laptop: basic apps + Hyprland (no creative/work extras)
  imports = [
    ./user-common.nix
    ../packages/browser.nix
    ../packages/desktop.nix      # waybar, hyprpaper, rofi, swaync etc.
    ../packages/editors.nix
    ../packages/file-manager.nix
    ../packages/terminal.nix
    ../desktop/hyprland.nix
    ../desktop/waybar.nix
    ../desktop/rofi.nix
    ../desktop/theme.nix
    ../terminal/kitty.nix
    ../terminal/tmux.nix
    ../terminal/shell.nix
    ../editors/nvim.nix
  ];

  # Wallpapers
  home.file.".local/share/backgrounds".source = ../wallpapers;
}
