{ home-manager, ... }:
{
  home.file = {
    ".config/wlogout/layout".text = ''
      {
        "label" : "lock",
        "action" : "swaylock --clock --indicator",
        "text" : "Lock",
        "keybind" : "l"
      }
      {
        "label" : "hibernate",
        "action" : "systemctl hibernate",
        "text" : "Hibernate",
        "keybind" : "h"
      }
      {
        "label" : "logout",
        "action" : "sleep 1; hyprctl dispatch exit",
        "text" : "Logout",
        "keybind" : "e"
      }
      {
        "label" : "shutdown",
        "action" : "systemctl poweroff",
        "text" : "Shutdown",
        "keybind" : "s"
      }
      {
        "label" : "suspend",
        "action" : "systemctl suspend",
        "text" : "Suspend",
        "keybind" : "u"
      }
      {
        "label" : "reboot",
        "action" : "systemctl reboot",
        "text" : "Reboot",
        "keybind" : "r"
      }
    '';
    ".config/wlogout/style.css".text = ''
      * {
	      background-image: none;
	      box-shadow: none;
      }

      window {
	      background-color: rgba(12, 12, 12, 0.9);
      }

      button {
        border-radius: 0;
        border-color: black;
	      text-decoration-color: #FFFFFF;
        color: #FFFFFF;
	      background-color: #1E1E1E;
	      border-style: solid;
	      border-width: 1px;
	      background-repeat: no-repeat;
	      background-position: center;
	      background-size: 25%;
      }

      button:focus, button:active, button:hover {
	      background-color: #3700B3;
	      outline-style: none;
      }

      #lock {
        background-image: image(url("../wlogoutimages/lock.png"), url("../wlogoutimages/lock.png"));
      }

      #logout {
        background-image: image(url("../wlogoutimages/logout.png"), url("../wlogoutimages/logout.png"));
      }

      #suspend {
        background-image: image(url("../wlogoutimages/suspend.png"), url("../wlogoutimages/suspend.png"));
      }

      #hibernate {
        background-image: image(url("../wlogoutimages/hibernate.png"), url("../wlogoutimages/hibernate.png"));
      }

      #shutdown {
        background-image: image(url("../wlogoutimages/shutdown.png"), url("../wlogoutimages/shutdown.png"));
      }

      #reboot {
        background-image: image(url("../wlogoutimages/reboot.png"), url("../wlogoutimages/reboot.png"));
      }
    '';
  };
}
