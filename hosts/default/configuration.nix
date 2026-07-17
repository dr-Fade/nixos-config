{ pkgs, ... }: {
  imports = [
    ./../../modules/nixos/locale.nix
    ./../../modules/nixos/networking.nix
    ./../../modules/nixos/ssh.nix
    ./../../modules/nixos/hyprland.nix
    # ./hardware-configuration.nix # Add this back once generated
  ];

  # Bootloader (default for most UEFI systems)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Basic system settings
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # User account (defined in home-manager but needed at system level for basic identity)
  users.users.eugene = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
  };

  system.stateVersion = "24.11";
}
