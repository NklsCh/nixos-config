{
  monitorSetup = {
    Desktop = ''
      # ---- Desktop-specific Monitor Setup ---- #
      monitor = DP-1, 1920x1080@180, 0x0, 1
      monitor = HDMI-A-2, 1920x1080, 1920x0, 1

      workspace = 1,  monitor:DP-1, default:true
      workspace = 2,  monitor:DP-1
      workspace = 3,  monitor:DP-1
      workspace = 4,  monitor:DP-1
      workspace = 5,  monitor:DP-1
      workspace = 6,  monitor:DP-1
      workspace = 7,  monitor:DP-1
      workspace = 8,  monitor:HDMI-A-2, default:true
      workspace = 9,  monitor:HDMI-A-2
      workspace = 10, monitor:HDMI-A-2
    '';
    Laptop = ''
      # ---- Laptop-specific Monitor Setup ---- #
      monitor =   eDP-1, 1920x1080, 0x0, 1
      monitor = , preferred, auto, 1
    '';
  };
  autostart = {
    Desktop = ''
      # ---- Desktop-specific Monitor Setup ---- #
      exec-once=bash ~/.scripts/autostart_desktop.sh
    '';
    Laptop = ''
      # ---- Laptop-specific Monitor Setup ---- #
      exec-once=bash ~/.scripts/autostart_laptop.sh
    '';
  };
}
