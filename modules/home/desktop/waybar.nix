{ pkgs, ... }: {
  # Waybar config delivered via file sources (keeping original from Arch setup)
  home.file.".config/waybar/config".source = ./waybar/config;
  home.file.".config/waybar/style.css".source = ./waybar/style.css;
}
