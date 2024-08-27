{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [
    zed-editor
  ];
  home-manager.users.${username} = {
    home.file = {
      ".config/zed/settings.json".text = ''
        {
          "telemetry": {
            "metrics": false
          },
          "theme": "Dracula",
          "vim_mode": true,
          "ui_font_size": 15,
          "buffer_font_size": 13,
          "buffer_font_family": "JetBrainsMono Nerd Font",
          "format_on_save": "on"
        }
      '';
    };
  };
}
