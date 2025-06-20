{
  config,
  hyprpanel,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    imports = [
      hyprpanel.homeManagerModules.hyprpanel
    ];

    programs.hyprpanel = {
      enable = true;
      hyprland.enable = true;
      overlay.enable = true;
      overwrite.enable = true;
      systemd.enable = true;
      settings = {
        layout = {
          "bar.layouts" = {
            "0" = {
              left = [
                "dashboard"
                "workspaces"
                "windowtitle"
              ];
              middle = [ "media" ];
              right = [
                "volume"
                "kbinput"
                "network"
                "bluetooth"
                "systray"
                "clock"
                "notifications"
              ];
            };
            "1" = {
              left = [
                "dashboard"
                "workspaces"
                "windowtitle"
              ];
              middle = [ "media" ];
              right = [
                "volume"
                "kbinput"
                "network"
                "bluetooth"
                "systray"
                "clock"
                "notifications"
              ];
            };
          };
        };
        bar.clock.format = "%a %b %d %R";
        bar.launcher.autoDetectIcon = true;
        bar.workspaces.show_numbered = true;
        bar.workspaces.workspaces = 10;
        menus.clock.time.military = true;
        menus.clock.weather.key = "$(cat ${config.sops.secrets."weatherAPI/key".path})";
        menus.clock.weather.location = "Viersen";
        menus.clock.weather.unit = "metric";
        theme.bar.floating = true;
        theme.bar.outer_spacing = "0.4em";
        theme.bar.transparent = true;
        theme.font.size = "0.8rem";
        theme.matugen = true;
        theme.matugen_settings.scheme_type = "fidelity";
        wallpaper.image = "/home/${username}/.config/backgrounds/dark_wallpaper.jpg";
      };
    };
  };
}
