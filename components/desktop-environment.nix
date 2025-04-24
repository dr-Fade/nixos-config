{ pkgs, ... }:

{
    # Configure keymap in X11
    services.xserver = {
        enable = true;

        desktopManager = {
            xterm.enable = false;
            xfce = {
                enable = true;
                noDesktop = true;
                enableXfwm = false;
            };
        };

        windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                rofi
                i3status
                i3blocks
            ];
        };

        xkb = {
            layout = "us,ua";
            options = "grp:alt_shift_toggle";
        };

    };

    services.displayManager.defaultSession = "xfce+i3";
}
