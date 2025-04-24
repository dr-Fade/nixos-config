{ lib, config, ... }:

let
    cfg = config.components.networking;
in {
    options.components.networking = {
        hostName = lib.mkOption {
            type = lib.types.str;
            default = "nixos";
        };
        #wifi = lib.mkOption {
        #    type = lib.types.bool;
        #    default = false;
        #};
    };
    config = {
        networking.hostName = cfg.hostName;
        #networking.wireless.enable = true;
        networking.networkmanager.enable = true;
    };
}
