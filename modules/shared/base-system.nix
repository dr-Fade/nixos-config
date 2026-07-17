{ pkgs, ... }: {
  imports = [
    ../nixos/locale.nix
    ../nixos/networking.nix
    ../nixos/ssh.nix
  ];

  # Bootloader (UEFI systems)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Basic system settings
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # User account
  users.users.eugene = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
  };

  system.stateVersion = "24.11";
}
