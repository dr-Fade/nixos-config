{ pkgs, ... }: {
  # Hyprland is a beast. Use the file source but keep it in the module folder.
  wayland.windowManager.hyprland = {
    enable = true;
    # We can't easily use settings for everything without translating the whole file,
    # which Grug thinks is a waste of life.
  };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
}
