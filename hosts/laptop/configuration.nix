{ ... }: {
  imports = [
    ../../modules/shared/base-system.nix
    ../../modules/nixos/hyprland.nix
    # ../../hardware-configuration.nix # Add once generated on laptop
  ];
}
