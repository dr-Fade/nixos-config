{ pkgs, ... }:

{
    users.users.eugene = {
        isNormalUser = true;
        description = "eugene";
        extraGroups = [ "networkmanager" "wheel" "audio" ];
        packages = with pkgs; [
            # misc
            chromium
            htop
            remmina
            # audio
            ardour
            calf
            carla
            guitarix
            # art
            inkscape
            krita
            # programming
            julia-bin
            # communication
            telegram-desktop
        ];
    };

    programs = {
        steam.enable = true;
        thunderbird.enable = true;
        thunar.enable = true;
    };

    services.getty.autologinUser = "eugene";

    location = {
        longitude = 48.45;
        latitude = 34.77;
    };
    services.redshift = {
        enable = true;
        temperature = {
            day = 5500;
            night = 4000;
        };
    };

}

