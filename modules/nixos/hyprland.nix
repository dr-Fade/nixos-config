{ pkgs, ... }: {
  # Hyprland system-level setup (REQUIRED by wiki) — session files, polkit, portals, etc.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Essential runtime deps that need OS-level presence
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
