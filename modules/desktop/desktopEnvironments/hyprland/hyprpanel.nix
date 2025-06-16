{
  agenix,
  hyprpanel,
  username,
  ...
}:
{
  home-manager.users.${username} =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        hyprpanel.homeManagerModules.hyprpanel
        agenix.homeManagerModules.default
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
          menus.clock.weather.key = "@HYPRPANEL_WEATHER_API_KEY@";
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

      home.activation."replace-hyprpanel-secret" = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        configFile="$HOME/.config/hyprpanel/config.json"
        if [ -f "$configFile" ]; then
          secret=$(${pkgs.coreutils}/bin/cat "${config.age.secrets.weatherAPI.path}")
          ${pkgs.gnused}/bin/sed -i "s#@HYPRPANEL_WEATHER_API_KEY@#$secret#" "$configFile"
        fi
      '';
    };
}
