{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Wayland / UI runtime deps
    waybar
    hyprpaper
    rofi-wayland
    swaync
    gammastep
    nwg-look

    # Hyprland config dependencies
    playerctl
    hyprshot

    # Fonts & theme
    nerd-fonts.fira-code
    waybar-native-package
    nordic
  ];
}
