{ home-manager, ... }:
{
  home.file = {
    ".config/waybar/config".text = ''
      {
        // "layer": "top", // Waybar at top layer
        // "position": "bottom", // Waybar position (top|bottom|left|right)
        // "height": 30, // Waybar height (to be removed for auto height)
        "margin": "5 10 0 10", // top, left, botton, right
        "layer": "top",
        "position": "top",
        // "height": 24,
        // "width": 1280, // Waybar width
        // Choose the order of the modules
        "modules-left": ["clock", "hyprland/workspaces", "image#album-art"],
        "modules-center": [],
        "modules-right": ["pulseaudio", "backlight", "tray", "battery", "network"],


        //***************************
        //*  Modules configuration  *
        //***************************

        "hyprland/workspaces": {
          "disable-scroll": true
        },

        "hyprland/language": {
          "format": "{} ",
          "min-length": 5,
          "tooltip": false
        },

        "keyboard-state": {
          //"numlock": true,
          "capslock": true,
          "format": "{name} {icon} ",
          "format-icons": {
            "locked": " ",
            "unlocked": ""
          },
        },

        "hyprland/mode": {
          "format": "<span style=\"italic\">{}</span>"
        },

        "clock": {
          // "timezone": "Europe/Berlin",
          "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
          "format": "{:%d.%m | %H:%M}"
        },

        "pulseaudio": {
          // "scroll-step": 1, // %, can be a float
          "reverse-scrolling": 1,
          "format": "{volume}% {icon} {format_source}",
          "format-bluetooth": "{volume}% {icon} {format_source}",
          "format-bluetooth-muted": " {icon} {format_source}",
          "format-muted": "󰝟     {format_source}",
          "format-source": "",
          "format-source-muted": "",
          "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": [" "]
          },
          "on-click": "pavucontrol",
          "min-length": 7,
        },


        "temperature": {
          "critical-threshold": 80,
          "format": "{temperatureC}°C {icon}",
          "format-icons": ["", "", "", "", ""],
          "tooltip": false,
        },

        "backlight": {
          "device": "intel_backlight",
          "format": "{percent}% {icon}",
          "format-icons": ["󰃞 ", "󰃟 ", "󰃠 "],
          "min-length": 7,
        },

        "battery": {
          "interval": 3,
          "states": {
            "warning": 30,
            "critical": 15
          },
          "format": "{capacity}% {icon}",
          "format-charging": "{capacity}% 󰂄",
          "format-plugged": "{capacity}%  ",
          "format-alt": "{time} {icon}",
          "format-icons": [" "," "," "," "," "],
        },

        "tray": {
          "icon-size": 16,
          "spacing": 2
        },

        "network": {
          "interval": 30,
          "format-wifi": " {ipaddr}", // Icon: wifi
          "format-ethernet": "󰈀 ", // Icon: ethernet
          "format-disconnected": "⚠  Disconnected",
          "tooltip-format": "{ifname}: {essid}",
          "on-click": ""
        },
    }
    '';
    ".config/waybar/style.css".text = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Liberation Mono;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces {
        margin-right: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        background: #434C5E;
      }

      #workspaces button {
        transition: none;
        color: #ffffff;
        background: transparent;
        padding: 5px;
        font-size: 16px;
      }

      #workspaces button.urgent {
        color: #c54626; 
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        color: #383c4a;
        background: #7c818c;
      }

      #workspaces button.active {
        color: #8FBCBB;
      }

      #language {
        padding-left: 16px;
        padding-right: 8px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
      }

      #keyboard-state {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
      }

      #mode {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #b4a5a5;
        background: #383c4a;
      }

      #clock {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #5E81AC;
      }

      #pulseaudio {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #81A1C1;
      }

      #pulseaudio.muted {
        background-color: #eb4d4b;
        color: #000000;
      }

      #temperature {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ebe5e5;
        background: #383c4a;
      }

      #temperature.critical {
        background-color: #eb4d4b;
      }

      #backlight {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #D08770;
      }

      #battery {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #8FBCBB;
      }

      #battery.charging {
        color: #000000;
        background-color: #8FBCBB;
      }

      #battery.warning:not(.charging) {
        background-color: #ffbe61;
        color: black;
      }

      #battery.critical:not(.charging) {
        background-color: #BF616A;
        color: #000000;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #tray {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
      }

      #network {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #B48EAD;
      }

      #network.format-disconncted {
        background-color: #ffbe61;
      }

      #album-art {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
      }
      }
    '';
  };
}
