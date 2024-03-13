{ pkgs, ... }:
{
    programs.alacritty = {
        enable = true;
        settings = {
            font = {
                size = 9;
                normal.family = "JetBrainsMono Nerd Font";
            };
            colors = {
                primary = {
                    background = "#282a36";
                    foreground = "#f8f8f2";
                    bright_foreground = "#ffffff";
                };
            };
        };
    };
}
