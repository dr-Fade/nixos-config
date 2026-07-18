{ pkgs, ... }: {
  # Hyprland system-level setup (REQUIRED by wiki) — session files, polkit, portals, etc.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Display manager: greetd with ReGreet (recommended DM for Hyprland per NixOS wiki)
  programs.regreet.enable = true;

  # Essential runtime deps that need OS-level presence
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
