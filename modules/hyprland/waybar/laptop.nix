{ home-manager, username, ... }:
{
  home-manager.users.${username} = _: {
  home.file = {
    ".config/waybar/config.jsonc".text = ''
      {
        "margin": "5 10 0 10", // top, left, botton, right
        "layer": "top",
        "position": "top",
        "modules-left": ["clock", "hyprland/workspaces", "image#album-art"],
        "modules-center": [],
        "modules-right": ["pulseaudio", "backlight", "tray", "battery", "network"],


        //***************************
        //*  Modules configuration  *
        //***************************

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
          "format-muted": "{volume}%   {format_source}",
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
          "format-charging": "{capacity}%  ",
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
        background: #7CAFC2;
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
        color: #000000;
        background: #7CAFC2;
      }

      #workspaces button.active {
        color: #000000;
      }

      #clock {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #BA8BAF;
      }

      #pulseaudio {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #F7B56C;
      }

      #pulseaudio.muted {
        background-color: #AB4642;
        color: #000000;
      }

      #backlight {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #A1B56C;
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
        background-color: #F7CA88;
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
        color: #F8F8F8;
        background: #000000;
      }

      #network {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #000000;
        background: #BA8BAF;
      }

      #network.format-disconncted {
        background-color: #F7CA88;
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
  };
}
