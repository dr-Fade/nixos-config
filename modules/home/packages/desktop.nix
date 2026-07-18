{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Wayland / UI runtime deps
    waybar
    hyprpaper
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
