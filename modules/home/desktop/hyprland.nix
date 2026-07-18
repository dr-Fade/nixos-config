{ pkgs, lib, ... }: let
  mainMod = "SUPER";
  terminal = "kitty";
  fileManager = "thunar";
  menu = "rofi -show drun -theme nord -show-icons";

  # Generate workspace binds for 1–9 and 0→10
  wsBinds = lib.concatMap (n: let
    ws = if n == 0 then "10" else toString n;
  in [
    "${mainMod}, ${toString n}, workspace, ${ws}"
    "${mainMod} SHIFT, ${toString n}, movetoworkspacesilent, ${ws}"
  ]) (lib.range 0 9);
in {
  # Declarative Hyprland config via Home Manager.
  # NixOS module (programs.hyprland.enable) handles system-level plumbing.
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;        # use NixOS-provided Hyprland
    portalPackage = null;  # same for xdg-desktop-portal-hyprland

    settings = {
      monitor = [
        "DP-2, 5120x1440@119.98800Hz, 0x0, 1"
      ];

      "$terminal"   = terminal;
      "$fileManager" = fileManager;
      "$menu"       = menu;
      "$mainMod"    = mainMod;

      exec-once = [
        "hyprpm reload -n"
        "systemctl --user start hyprpolkitagent"
        "gammastep-indicator -t 6000:4000 -l 48.47:35.00"
        "waybar"
        "nm-applet"
        "zen-browser"
        "[workspace 2] $terminal"
        "[workspace 7 silent] steam"
        "[workspace 1 silent] Telegram"
      ];

      env = [
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
      ];

      general = {
        gaps_in       = 2;
        gaps_out      = 4;
        border_size   = 1;
        col.active_border = [
          "rgba(844FDEaa)" "rgba(FFFFFFaa)" "rgba(1C4CC2aa)"
          "rgba(67E6D0aa)" "90deg"
        ];
        col.inactive_border        = "rgba(00000000)";
        col.nogroup_border         = "rgba(282a36dd)";
        col.nogroup_border_active  = "rgb(bd93f9) rgb(44475a) 90deg";
        resize_on_border           = false;
        allow_tearing             = false;
        layout                     = "dwindle";
      };

      decoration = {
        rounding       = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled      = true;
          range        = 4;
          render_power = 3;
          color        = "rgba(1a1a1aee)";
        };
        blur = {
          enabled  = false;
          size     = 3;
          passes   = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1.0"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 5, default"
          "border, 1, 2.39, easeOutQuint"
          "windows, 1, 2.79, easeOutQuint"
          "windowsIn, 1, 2.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 0.7, linear, popin 87%"
          "fadeIn, 1, 0.8, almostLinear"
          "fadeOut, 1, 0.7, almostLinear"
          "fade, 1, 1.5, quick"
          "layers, 1, 2.81, easeOutQuint"
          "layersIn, 1, 2, easeOutQuint, fade"
          "layersOut, 1, 0.75, linear, fade"
          "fadeLayersIn, 1, 0.85, almostLinear"
          "fadeLayersOut, 1, 0.7, almostLinear"
          "workspaces, 1, 0.9, almostLinear, slidefadevert"
        ];
      };

      group = {
        groupbar = {
          col.active   = "rgb(bd93f9) rgb(44475a) 90deg";
          col.inactive = "rgba(282a36dd)";
        };
      };

      windowrule = [
        "workspace 1, match:class Zen"
        "workspace 1, match:class org.telegram.desktop"
        "workspace 3, match:class code"
        "workspace 5, match:class steam"
        "float on,match:class org.gnome.Calculator"
        "suppress_event maximize, match:class .*"
      ];

      windowrulev2 = [
        {
          matchFromClass  = "^$";
          matchFromTitle  = "^$";
          matchXwayland   = true;
          matchFloating   = true;
          matchFullscreen = false;
          matchPinned     = false;
          no_focus        = true;
        }
      ];

      dwindle = {
        pseudotile   = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        middle_click_paste       = true;
        force_default_wallpaper  = -1;
        disable_splash_rendering = true;
        disable_hyprland_logo    = true;
      };

      input = {
        kb_layout   = "us,ua";
        kb_options  = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0.0;
        touchpad = {
          natural_scroll = false;
        };
      };

      device = [
        {
          name        = "epic-mouse-v2";
          sensitivity = -0.5;
        }
      ];

      # All binds merged into single keys (no duplicate attributes)
      bind =
        [
          "${mainMod}, Return, exec, $terminal"
          "${mainMod} SHIFT, Q, killactive,"
          "${mainMod}, M, exit,"
          "${mainMod}, E, exec, $fileManager"
          "${mainMod} SHIFT, SPACE, togglefloating,"
          "${mainMod}, D, exec, $menu"
          "${mainMod}, P, pseudo,"
          "${mainMod}, J, togglesplit,"
          "${mainMod}, left, movefocus, l"
          "${mainMod}, right, movefocus, r"
          "${mainMod}, up, movefocus, u"
          "${mainMod}, down, movefocus, d"
          "${mainMod} SHIFT, left, movewindow, l"
          "${mainMod} SHIFT, right, movewindow, r"
          "${mainMod} SHIFT, up, movewindow, u"
          "${mainMod} SHIFT, down, movewindow, d"
          "${mainMod}, F, fullscreen,"
        ]
        ++ wsBinds
        # Media (latched)
        ++ [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ]
        # Screenshots
        ++ [
          ", PRINT, exec, hyprshot -m region --raw --clipboard-only | swappy -f -"
        ];

      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      # Volume / brightness (edge-triggered)
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%"
      ];
    };
  };

  # Hyprpaper HM service — auto-starts via hyprland-session.target
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/eugene/Pictures/luna-stream-wall-7680x2160_black.png";
      splash  = false;
      wallpaper = [
        {
          monitor = "DP-2";
          path    = "/home/eugene/Pictures/luna-stream-wall-7680x2160_black.png";
        }
      ];
    };
  };

  # SwayNC notification daemon — auto-started via hyprland-session.target
  services.swaync = {
    enable = true;
  };
}
