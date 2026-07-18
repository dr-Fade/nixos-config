{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Wayland / UI runtime deps
    waybar
    hyprpaper
    rofi
    gammastep
    nwg-look

    # Hyprland config dependencies
    playerctl
    hyprshot

    # Fonts & theme
    nerd-fonts.fira-code
    nordic
  ];
}
