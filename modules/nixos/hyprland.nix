{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Essential Wayland/Hyprland deps from Arch list
  services.dbus.enable = true;
  
  environment.systemPackages = with pkgs; [
    kitty
    waybar
    hyprpaper
    rofi-wayland
    swaync
    pavucontrol
    thunar
    # Essential runtime deps referenced in configs but missing
    hyprpolkitagent
    brightnessctl
    xdg-desktop-portal-hyprland
    # Development tools from Arch list
    cmake
    meson
    pkg-config
  ];
}
