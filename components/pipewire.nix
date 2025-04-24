{
    security.rtkit.enable = true;
    security.pam.loginLimits = [
        {
            domain = "*";
            type = "-";
            item = "memlock";
            value = "unlimited";
        }
        {
            domain = "*";
            type = "-";
            item = "rtprio";
            value = "95";
        }
    ];
    services.pipewire = {
        enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
}
