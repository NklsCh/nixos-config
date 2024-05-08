{ home-manager, ... }:
{
  home-manager = {
    home.file = {
      ".config/waybar/config".text = ''
        {
  "modules-left": [
    "sway/workspaces", 
    "sway/mode", 
    "clock", 
    "idle_inhibitor" 
  ],
  "modules-center": [
    "hyprland/workspaces"
  ], 
  "modules-right": [
    "tray", 
    "custom/scratchpad-indicator", 
    "pulseaudio",
    "backlight",
    "battery",
    "custom/power"
  ],

  "hyprland/workspaces": {
    "on-click": "activate",
    "active-only": false,
    "all-outputs": true,
    "format": "{}",
    "format-icons": {
      "urgent": "",
      "active": "",
      "default": ""
    },
    "persistent-workspaces": {
      "*": 5
    }
  },

  "sway/mode": {
    "format": "<span style=\"italic\">{}</span>"
  },
  "network": {
    "format-wifi": "{essid} ({signalStrength}%)  ",
    "format-ethernet": "{ifname}  ",
    "format-disconnected": " ", 
    "max-length": 50,
    "on-click": "alacritty -e 'nmtui'"
  },
  "idle_inhibitor": {
    "format": "{icon}",
    "format-icons": {
      "activated": " ",
      "deactivated": " "
    },
	  "on-click": "bash /home/dg/.local/bin/toggleRemote"
  },
  "tray": {
    "icon-size": 15,
    "spacing": 10
  },
  "clock": {
    // "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
    // "format-alt": "{:%Y-%m-%d}"
		"on-click": "gnome-calendar"
  },
  "pulseaudio": {
    "format": "{volume}% {icon} ",
    "format-bluetooth": "{volume}% {icon} {format_source}",
    "format-bluetooth-muted": " {icon} {format_source}",
    "format-muted": " ",
    "format-source": "{volume}% ",
    "format-source-muted": " ",
    "format-icons": {
      "headphone": " ",
      "hands-free": " ",
      "headset": " ",
      "phone": "",
      "portable": "",
      "car": " ",
      "default": ["", "", ""]
    },
    "on-click": "pavucontrol"
  },
  "backlight": {
    "format": "{percent}% {icon} ",
    "format-icons": [" ", " "]
  },
  "battery": {
    "states": {
      // "good": 95,
      "warning": 30,
      "critical": 15
    },
    "format": "{icon}   {capacity}%",
    "format-charging": "  {capacity}%",
    "format-alt": "{icon}  {time}",
    "format-icons": [" ", " ", " ", " ", " "]
  },
	"custom/power": {
		"format": " ",
    "on-click": "wlogout"
	},
  "custom/scratchpad-indicator": {
    "format-text": "{}hi",
    "return-type": "json",
    "interval": 3,
    "exec": "~/.local/bin/scratchpad-indicator 2> /dev/null",
    "exec-if": "exit 0",
    "on-click": "swaymsg 'scratchpad show'",
    "on-click-right": "swaymsg 'move scratchpad'"
  }
}
      '';
      ".config/waybar/style.css".text = ''
        * {
  border: none;
  font-family: Font Awesome, Roboto, Arial, sans-serif;
  font-size: 13px;
  color: #000000;
  border-radius: 20px;
}

window {
	/*font-weight: bold;*/
}
window#waybar {
  background: rgba(0, 0, 0, 0);
}
/*-----module groups----*/
.modules-right {
  background-color: rgba(255,255,247,0.85);
  margin: 2px 10px 0 0;
}
.modules-center {
  background-color: rgba(255,255,247,0.85);
  margin: 2px 0 0 0;
}
.modules-left {
  margin: 2px 0 0 5px;
  background-color: rgba(255,255,247,0.85);
}
/*-----modules indv----*/
#workspaces button {
  padding: 0px 5px;
  margin: 4px 3px;
  border-radius: 15px;
  border: 0px;
  transition: all 0.3s ease-in-out;
}
#workspaces button:hover {
  background: rgba(175,175,167,0.5);
  border-radius: 15px;
}

#workspaces button.active {
  background: rgba(175,175,167,1);
  border-radius: 15px;
  min-width: 40px;
  transition: all 0.3s ease-in-out;
}

tooltip {
  border-radius: 10px;
  background-color: rgba(255,255,247,0.85);
  opacity: 0.8;
  padding: 20px;
  margin: 0px;
}

tooltip label {
  color: #000000;
}

#clock,
#battery,
#cpu,
#memory,
#temperature,
#network,
#pulseaudio,
#custom-media,
#tray,
#mode,
#custom-power,
#custom-menu,
#idle_inhibitor {
  padding: 0 10px;
}
#mode {
  color: #cc3436;
  font-weight: bold;
}
#custom-power {
  background-color: rgba(175,175,167,0.6);
  border-radius: 100px;
  margin: 5px 5px;
  padding: 1px 1px 1px 6px;
}
/*-----Indicators----*/
#idle_inhibitor.activated {
  color: #2dcc36;
}
#pulseaudio.muted {
  color: #cc3436;
}
#battery.charging {
  color: #2dcc36;
}
#battery.warning:not(.charging) {
	color: #e6e600;
}
#battery.critical:not(.charging) {
  color: #cc3436;
}
#temperature.critical {
  color: #cc3436;
}
/*-----Colors----*/
/*
 *rgba(0,85,102,1),#005566 --> Indigo(dye)
 *rgba(0,43,51,1),#002B33 --> Dark Green 
 *rgba(0,153,153,1),#009999 --> Persian Green 
 *
 */
      '';
    };
  };
}
