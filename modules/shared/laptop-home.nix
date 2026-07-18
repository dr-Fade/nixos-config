{ pkgs, dms, ... }: {
  # Laptop: basic apps + Hyprland (no creative/work extras)
  imports = [
    ./user-common.nix
    ../home/packages/browser.nix
    ../home/packages/desktop.nix
    ../home/packages/editors.nix
    ../home/packages/file-manager.nix
    ../home/packages/terminal.nix
    ../home/desktop/hyprland.nix
    ../home/desktop/theme.nix
    ../home/terminal/kitty.nix
    ../home/terminal/tmux.nix
    ../home/terminal/shell.nix
    ../home/editors/nvim.nix

    dms.homeModules.default
  ];

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
  };

  # Include DMS keybind overrides (written to ~/.config/hypr/dms/)
  wayland.windowManager.hyprland.extraConfig = ''
    include = ~/.config/hypr/dms/*
  '';
}
