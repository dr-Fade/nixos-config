{ pkgs, ... }: {
  imports = [
    ./user-common.nix
    ../home/packages/browser.nix
    ../home/packages/creative.nix
    ../home/packages/desktop.nix
    ../home/packages/editors.nix
    ../home/packages/file-manager.nix
    ../home/packages/terminal.nix
    ../home/packages/work.nix
    ../home/desktop/hyprland.nix
    ../home/desktop/waybar.nix
    ../home/desktop/rofi.nix
    ../home/desktop/theme.nix
    ../home/terminal/kitty.nix
    ../home/terminal/tmux.nix
    ../home/terminal/shell.nix
    ../home/editors/nvim.nix
  ];

  # Wallpapers
  home.file.".local/share/backgrounds".source = ../home/wallpapers;
}
