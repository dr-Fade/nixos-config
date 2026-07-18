{ pkgs, lib, ... }: let
  terminal = "kitty";
in {
  xdg.configFile."hypr/dms/user-settings.lua".source = pkgs.writeText "user-settings.lua" (''
    -- User Hyprland settings (Nix-managed). Loaded via dms/binds-user.lua
    -- ponytail: monitor config omitted — set via DMS Settings UI per-machine

    hl.config({
      env = {
        "XCURSOR_SIZE 24",
        "HYPRCURSOR_SIZE 24",
      },
      general = {
        gaps_in = 2,
        gaps_out = 4,
        border_size = 1,
        layout = "dwindle",
      },

      dwindle = { preserve_split = true },
      master = { new_status = "master" },
      misc = {
        middle_click_paste = true,
        force_default_wallpaper = -1,
        disable_splash_rendering = true,
        disable_hyprland_logo = true,
      },
      input = {
        kb_layout = "us,ua",
        kb_options = "grp:alt_shift_toggle",
        follow_mouse = 1,
        sensitivity = 0.0,
        touchpad = { natural_scroll = false },
      },
      device = { { name = "epic-mouse-v2", sensitivity = -0.5 } },
    })

    -- Window rules
    hl.window_rule({ match = { class = "^Zen$" }, workspace = "1" })
    hl.window_rule({ match = { class = "^org\\.telegram\\.desktop$" }, workspace = "1" })
    hl.window_rule({ match = { class = "^code$" }, workspace = "3" })
    hl.window_rule({ match = { class = "^steam$" }, workspace = "5" })
    hl.window_rule({ match = { class = "^org\\.gnome\\.Calculator$" }, float = true })

    -- Keybind overrides (loaded LAST after DMS defaults)

    -- App launchers
    hl.bind("SUPER + return", hl.dsp.exec_cmd("${terminal}"))
    hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
    hl.bind("SUPER + D", hl.dsp.exec_cmd("dms ipc call spotlight open"))

    -- Window management
    hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
    hl.bind("SUPER + M", hl.dsp.exit())
    hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
    hl.bind("SUPER + P", hl.dsp.layout("pseudo"))
    hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
    hl.bind("SUPER + f", hl.dsp.window.fullscreen({ type = 0 }))

    -- Screenshot (hyprshot|swappy pipeline)
    hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --raw --clipboard-only | swappy -f -"))

    -- Media player controls (playerctl instead of DMS mpris)
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

    -- Volume (wpctl instead of DMS audio)
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

    -- Brightness (brightnessctl instead of DMS brightness)
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

    -- Mouse drag move/resize
    hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
  '');

  # Override DMS's empty binds-user.lua to load our settings (last in require chain).
  xdg.configFile."hypr/dms/binds-user.lua".source = pkgs.writeText "binds-user.lua" ''
    -- User overrides loaded after DMS defaults (Nix-managed)
    require("dms/user-settings")
  '';
}
