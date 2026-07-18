{ name, self, ... }: let
  dms = self.inputs.dms;
in {
  imports = [
    ../../modules/shared/base-system.nix
    ../../modules/nixos/hyprland.nix
    dms.nixosModules.default
    dms.nixosModules.greeter
    # ../../hardware-configuration.nix # Add once generated on laptop
  ];

  # DMS greeter requires greetd.user; its module sets enable=mkDefault true
  services.greetd.settings.default_session.user = "eugene";

  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "hyprland";
  };
}
