{ pkgs, ... }: {
  imports = [
    ./user-common.nix
    ../packages/browser.nix
    ../packages/creative.nix
    ../packages/desktop.nix
    ../packages/editors.nix
    ../packages/file-manager.nix
    ../packages/terminal.nix
    ../packages/work.nix
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
