{ home-manager, username, ... }:
{
  home-manager.users.${username} = _: {
  home.file = {
    ".config/waybar/config.jsonc".text = ''
      // -*- mode: jsonc -*-
      {
        "spacing": 4,
        "modules-left": [
          "hyprland/workspaces",
          "custom/weather",
        ],
        "modules-center": [],
        "modules-right": [
          "tray",
          "pulseaudio",
          "network",
          "bluetooth",
          "battery",
          "clock",
          "custom/notification"
        ],
        "tray": {
          // "icon-size": 21,
          "spacing": 10
        },
        "clock": {
          "timezone": "Europe/Berlin",
          "format": "  {:%H:%M}",
          "format-alt": "  {:%d/%m/%Y}",
          "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
        },
        "battery": {
          "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
          },
          "format": "{icon} {capacity}%",
          "format-full": "{icon} {capacity}%",
          "format-charging": " {capacity}%",
          "format-plugged": " {capacity}%",
          "format-alt": "{icon} {time}",
          "format-icons": [" ", " ", " ", " ", " "]
        },
        "network": {
          // "format-wifi": "  {essid} ({signalStrength}%)",
          "format-wifi": "  {signalStrength}%",
          "format-ethernet": "󰈀  {ipaddr}/{cidr}",
          "format-disconnected": "  Disconnected",
          "on-click": "alacritty -e sh -c nmtui" 
        },
        "pulseaudio": {
          "scroll-step": 5, // %, can be a float
          "format": "{icon} {volume}%",
          "format-bluetooth": "{volume}% {icon} ",
          "format-bluetooth-muted": "   Muted",
          "format-muted": "  Muted",
          "format-icons": {
            "headphone": " ",
            "hands-free": "  ",
            "headset": "  ",
            "phone": "  ",
            "portable": "  ",
            "car": "  ",
            "default": [" ", " ", " "]
          },
          "on-click": "pavucontrol"
          },
          "bluetooth": {
            // "controller": "controller1", // specify the alias of the controller if there are more than 1 on the system
            "format": "",
            "format-disabled": "󰂲",
            "format-connected": "󰂱",
            // "tooltip-format": "{controller_alias}\t{controller_address}",
            // "tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{device_enumerate}",
            // "tooltip-format-enumerate-connected": "{device_alias}\t{device_address}",
            "on-click": "blueman-manager"
          },
          "custom/weather": {
            "format": "{}",
            "tooltip": false,
            "interval": 60,
            "exec": "wttrbar --custom-indicator '{ICON} {temp_C}ºC'",
            "return-type": "json"
          },
          "custom/notification": {
            "tooltip": false,
            "format": "{icon}",
            "format-icons": {
              "notification": " <span foreground='red'><sup></sup></span>",
              "none": "",
              "dnd-notification": " <span foreground='red'><sup></sup></span>",
              "dnd-none": " ",
              "inhibited-notification": " <span foreground='red'><sup></sup></span>",
              "inhibited-none": " ",
              "dnd-inhibited-notification": " <span foreground='red'><sup></sup></span>",
              "dnd-inhibited-none": " " 
            },
            "return-type": "json",
            "exec-if": "which swaync-client",
            "exec": "swaync-client -swb",
            "on-click": "swaync-client -t -sw",
            "on-click-right": "swaync-client -d -sw",
            "escape": true
          }
        }
      '';
    ".config/waybar/style.css".text = ''
      * {
	border: none;
	border-radius: 10px;
	font-family: "JetBrainsMono Nerd Font, FontAwesome" ;
	font-size: 15px;
	min-height: 10px;
}

window#waybar {
	background: transparent;
}

window#waybar.hidden {
	opacity: 0.2;
}

#window {
	margin-top: 6px;
	padding-left: 10px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
    color: transparent;
	background: transparent;
}

#workspaces {
	margin-top: 6px;
	margin-left: 12px;
	font-size: 4px;
	margin-bottom: 0px;
	border-radius: 10px;
	background: #ba8baf;
	transition: none;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#workspaces button {
	transition: none;
	color: #ffffff;
	background: transparent;
	font-size: 16px;
	border-radius: 2px;
}

#workspaces button.occupied {
	transition: none;
	color: #000000;
	background: transparent;
	font-size: 4px;
}

#workspaces button.active {
	color: #000000;
}

#workspaces button:hover {
	transition: none;
	box-shadow: inherit;
	text-shadow: inherit;
	border-color: #ba8baf;
	color: #ffffff;
}

#workspaces button.active:hover {
    color: #000000;
}

#network {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 8px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #000000;
	background: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#pulseaudio {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 8px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #000000;
	background: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#battery {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 8px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #000000;
	background: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#battery.charging, #battery.plugged {
	color: #000000;
    background-color: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#battery.critical:not(.charging) {
    background-color: #ba8baf;
    color: #000000;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

@keyframes blink {
    to {
        background-color: #ba8baf;
        color: #000000;
    }
}

#clock {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 8px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #000000;
	background: #ba8baf;
	border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#tray {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 8px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #000000;
	background: #292929;
    border-bottom-width: 5px;
    border-bottom-color: #3c3c3c;
    border-bottom-style: solid;
}

#custom-notification {
    margin-top: 6px;
    margin-left: 8px;
	margin-right: 8px;
    padding-left: 10px;
    margin-bottom: 0px;
    padding-right: 15px;
    border-radius: 10px;
    transition: none;
    color: #000000;
    background: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#custom-weather {
	margin-top: 6px;
	margin-left: 8px;
	margin-right: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 15px;
	border-radius: 10px;
	transition: none;
	color: #000000;
	background: #ba8baf;
	border-bottom-width: 5px;
	border-bottom-color: #995b8a;
	border-bottom-style: solid;
}

#bluetooth {
    margin-top: 6px;
    margin-left: 8px;
    padding-left: 8px;
    margin-bottom: 0px;
    padding-right: 10px;
    border-radius: 10px;
    transition: none;
    color: #000000;
    background: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

#window {
    margin-top: 6px;
    margin-left: 8px;
    padding-left: 8px;
    margin-bottom: 0px;
    padding-right: 10px;
    border-radius: 10px;
    transition: none;
    color: #000000;
    background: #ba8baf;
    border-bottom-width: 5px;
    border-bottom-color: #995b8a;
    border-bottom-style: solid;
}

window#waybar.empty #window {  
 background:none;  
 border-bottom-width: 5px;
 border-bottom-color: transparent;
 border-bottom-style: solid;
}  
    '';
  };
  };
}
