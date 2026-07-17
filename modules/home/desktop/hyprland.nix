{ pkgs, ... }: {
  # Hyprland is installed at the nixos level (programs.hyprland.enable).
  # Config is managed via source files — no need for HM windowManager option.
  home.file.".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
}
