{ lib, config, pkgs, ... }: {
  imports = [ ./binds.nix ./waybar.nix ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      # Same as default, but stop graphical-session too
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    settings = {
      general = {
        gaps_in = 15;
        gaps_out = 20;
        border_size = 2;
      };

      group = { groupbar.font_size = 11; };

      binds = {
        movefocus_cycles_fullscreen = false;

      };

      input = { kb_layout = "pl,us"; };

      dwindle = {
        split_width_multiplier = 1.35;
        pseudotile = true;
        preserve_split = "yes";
      };

      misc = {
        vfr = true;
        close_special_on_empty = true;
        focus_on_activate = true;
        # Unfullscreen when opening something
        new_window_takes_over_fullscreen = 2;
      };

      decoration = {
        active_opacity = 0.97;
        inactive_opacity = 0.77;
        fullscreen_opacity = 1.0;
        rounding = 7;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
        };
        drop_shadow = true;
        shadow_range = 12;
        shadow_offset = "3 3";
        "col.shadow" = "0x44000000";
        "col.shadow_inactive" = "0x66000000";
      };
      animations = { enabled = true; };

      exec = [ "${pkgs.hyprpaper}/bin/hyprpaper" ];
    };

    extraConfig = ''
      monitor=DP-2,2560x1440,-2560x0,1
      monitor=HDMI-A-1,1920x1080,0x0,1
    '';
  };
}
