#
# jovian.nix -- Gaming
#
{pkgs, ...}: let
    # Local user account for auto login
    # Separate and distinct from Steam login
    # Can be any name you like
    gameuser = "gamer";
    jovian-nixos = builtins.fetchGit {
        url = "https://github.com/Jovian-Experiments/Jovian-NixOS";
        ref = "development";
    };
in {
    system.activationScripts = {
        print-jovian = {
            text = builtins.trace "building the jovian configuration..." "";
        };
    };

    #
    # Imports
    #
    imports = [ "${jovian-nixos}/modules" ];

    #
    # Boot
    #
    boot.kernelParams = [
        "amd_pstate=active"
        "quiet"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
    ];

    #
    # Hardware
    #
    hardware.amdgpu = {
        amdvlk = {
            enable = true;
            support32Bit.enable = true;
        };

        initrd.enable = true;
    };

    hardware.xone.enable = true;

    #
    # Jovian
    #
    jovian.hardware.has.amd.gpu = true;

    jovian.steam.enable = true;

    #
    # Packages
    #
    environment.systemPackages = with pkgs; [
        steam-rom-manager # App for adding 3rd party games/ROMs as Steam launch items
    ];

    #
    # SDDM
    #
    services.displayManager.sddm.settings = {
        Autologin = {
            Session = "gamescope-wayland.desktop";
            User = "${gameuser}";
        };
    };

    #
    # Steam
    #
    # Set game launcher: gamemoderun %command%
    #   Set this for each game in Steam, if the game could benefit from a minor
    #   performance tweak: YOUR_GAME > Properties > General > Launch > Options
    #   It's a modest tweak that may not be needed. Jovian is optimized for
    #   high performance by default.
    programs.gamemode = {
        enable = true;
        settings = {
            general = {
                renice = 10;
            };
            gpu = {
                apply_gpu_optimisations = "accept-responsibility"; # For systems with AMD GPUs
                    gpu_device = 0;
                amd_performance_level = "high";
            };
        };
    };

    programs.steam = {
        enable = true;
        localNetworkGameTransfers.openFirewall = true;
    };

    #
    # Users
    #
    users = {
        groups.${gameuser} = {
            name = "${gameuser}";
            gid = 10000;
        };

        # Generate hashed password: mkpasswd -m sha-512
        # hashedPassword sets the initial password. Use `passwd` to change it.
        users.${gameuser} = {
            description = "${gameuser}";
            extraGroups = ["gamemode" "networkmanager"];
            group = "${gameuser}";
            hashedPassword = "6$8JPcusVugrgntSc9$6Yc03wpMC4cLs1kEaevgIx.uhmH2xXNxaXIEn.PKL7O6fPNcSYMDuf9v7FVtbzYnFz8Z4IIx9kd7qEEk.iA440"; # <<<--- Generate your own initial hashed password
            home = "/home/${gameuser}";
            isNormalUser = true;
            uid = 10000;
        };
    };

    #
    # Boot
    #
    boot = {
        consoleLogLevel = 0;

        initrd.verbose = false;

        kernelPackages = pkgs.linuxPackages_latest;

        plymouth.enable = true; # Splash screen
    };

    #
    # Nix
    #
    nix = {
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 60d";
        };
    };

}

