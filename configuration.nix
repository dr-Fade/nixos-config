{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./users
        ./components
        ./apps
        ./components/jovian.nix
    ];

    components.networking.hostName = "nixos-vm";

    # global settings
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "24.11";
}
