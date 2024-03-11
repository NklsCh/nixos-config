{ pkgs, ... }:
{
    programs.alacritty = {
        enable = true;
        settings = {
            font = {
                size = 9;
                normal.family = "JetBrainsMono Nerd Font";
            };
        };
    };
}