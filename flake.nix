{
  description = "NixOS Flake for Eugene";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    hmBase = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  in {
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self; name = "nixos-pc"; };
      modules = [
        ./hosts/pc/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = hmBase // {
            users.eugene = import ./modules/shared/pc-home.nix;
          };
        }
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self; name = "nixos-laptop"; };
      modules = [
        ./hosts/laptop/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = hmBase // {
            users.eugene = import ./modules/shared/laptop-home.nix;
          };
        }
      ];
    };
  };
}
