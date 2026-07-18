{ pkgs, lib, ... }: {
  # Keep HM wrapper scripts + XDG portal; all hyprland settings migrated to DMS Lua config (dms-hyprland.nix).
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;        # use NixOS-provided Hyprland
    portalPackage = null;  # same for xdg-desktop-portal-hyprland
  };
}
