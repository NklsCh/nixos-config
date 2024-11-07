{ username, hostName, ... }:
let
  monitorSetup = {
    Desktop = ''
      # ---- Desktop-specific Monitor Setup ---- #
      monitor = DP-1, 1920x1080@180, 0x0, 1
      monitor = HDMI-A-2, 1920x1080, 1920x0, 1

      workspace = 1, monitor:DP-1, default:true
      workspace = 2, monitor:DP-1
      workspace = 3, monitor:DP-1
      workspace = 4, monitor:HDMI-A-2, default:true
      workspace = 5, monitor:HDMI-A-2
      workspace = 6, monitor:HDMI-A-2
    '';
    Laptop = ''
      # ---- Laptop-specific Monitor Setup ---- #
      monitor = eDP-1, 1920x1080, 0x0, 1
      monitor = , preferred, auto, 1
    '';
  };
in
{
  # ---- Hyprland ---- #
  home-manager.users.${username} = _: {
    home.file = {
      ".config/hypr/hyprland.conf".text = ''
        # ---- Common Configuration ---- #
        ${monitorSetup.${hostName} or ''''}

        # ---- Environment Variables ---- #
        env = XDG_CURRENT_DESKTOP,Hyprland
        env = XDG_SESSION_DESKTOP,Hyprland
        env = XDG_SESSION_TYPE,wayland
        env = GDK_BACKEND,wayland,x11
        env = MOZ_ENABLE_WAYLAND,1
        env = MOZ_DISABLE_RDD_SANDBOX,1
        env = XCURSOR_SIZE,24
        env = QT_QPA_PLATFORM,wayland
        env = QT_QPA_PLATFORMTHEME,qt5ct

        input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
            natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

        general {
          gaps_in = 5
          gaps_out = 10
          border_size = 2
          col.active_border = rgba(ba8bafee) rgba(ba8bafee) 45deg
          col.inactive_border = rgba(585858aa)

          layout = dwindle
        }

        decoration {
          rounding = 10

          blur {
            enabled = true
            size = 3
            passes = 1
          }

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
        }

        animations {
          enabled = yes
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
        }

        dwindle {
          pseudotile = yes
          preserve_split = yes
          # no_gaps_when_only = 1
        }

        # master {
        #   new_is_master = true
        # }

        gestures {
          workspace_swipe = off
        }

        misc {
          force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
        }

        device {
          name = epic-mouse-v1
          sensitivity = -0.5
        }

        # ---- Keybinds ---- #

        $mainMod = SUPER


        # Applications
        bind = $mainMod, T, exec, alacritty
        bind = $mainMod, C, killactive,
        bind = $mainMod, M, exit,
        bind = $mainMod, E, exec, nemo
        bind = $mainMod, V, togglefloating,
        bind = $mainMod, R, exec, wofi --show drun
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, Q, togglesplit, # dwindle
        bind = $mainMod ALT_L, L, exec, hyprlock
        bind = $mainMod, S, exec, rofi -show drun -showicons
        bind = $mainMod SHIFT, E, exec, rofi -modi emoji -show emoji

        # Move focus with mainMod + vim binds
        bind = $mainMod, h, movefocus, l
        bind = $mainMod, l, movefocus, r
        bind = $mainMod, k, movefocus, u
        bind = $mainMod, j, movefocus, d

        # Move Window
        bind = $mainMod SHIFT, h, movewindow, l
        bind = $mainMod SHIFT, l, movewindow, r
        bind = $mainMod SHIFT, k, movewindow, u
        bind = $mainMod SHIFT, j, movewindow, d

        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

        # Make a screenshot
        bind = $mainMod SHIFT, s, exec, filename=~/Pictures/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png; grim -g "$(slurp -d)" "$filename" && wl-copy < "$filename"

        # Audio Controlls
        bind = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
        bind = , XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
        bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bind = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

        # Brightness controll
        bind = , XF86MonBrightnessUp, exec, brightnessctl s +5%
        bind = , XF86MonBrightnessDown, exec, brightnessctl s 5%-

        # ---- Window Rules ---- #
        # Pavucontrol
        windowrulev2 = float, class:^(pavucontrol)$
        windowrulev2 = maxsize 300 300, class:^(pavucontrol)$
        windowrulev2 = move onscreen 86% 4%, class:^(pavucontrol)$

        # XWayland Videobridge for Screensharing in Discord
        windowrulev2 = opacity 0.0 override, class:^(xwaylandvideobridge)$
        windowrulev2 = noanim, class:^(xwaylandvideobridge)$
        windowrulev2 = noinitialfocus, class:^(xwaylandvideobridge)$
        windowrulev2 = maxsize 1 1, class:^(xwaylandvideobridge)$
        windowrulev2 = noblur, class:^(xwaylandvideobridge)$

        exec-once=bash ~/.scripts/autostart_desktop.sh
      '';
    };
  };
}
