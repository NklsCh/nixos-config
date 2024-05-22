{ pkgs, ... }:
{
  programs.oh-my-posh = {
    enable = false;
  };
  home.file = {
    ".poshThemes/theme.omp.json".text = ''
      {
        "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
        "blocks": [
          {
            "alignment": "left",
            "segments": [
              {
                "background": "#0C212F",
                "foreground": "#FFFFFF",
                "leading_diamond": "\ue0b6",
                "style": "diamond",
                "template": " {{ .Icon }} ",
                "trailing_diamond": "\ue0b0",
                "type": "os"
              },
              {
                "background": "#DE2121",
                "foreground": "#FFFFFF",
                "leading_diamond": "<transparent,#DE2121>\ue0b0</>",
                "style": "diamond",
                "template": " \uf0e7 ",
                "trailing_diamond": "\ue0b0",
                "type": "root"
              },
              {
                "background": "#26BDBB",
                "foreground": "#0C212F",
                "leading_diamond": "<transparent,#26BDBB>\ue0b0</>",
                "properties": {
                  "folder_icon": "...",
                  "folder_separator_icon": "<transparent> \ue0b1 </>",
                  "home_icon": "\ueb06",
                  "style": "agnoster_short"
                },
                "style": "diamond",
                "template": " {{ .Path }} ",
                "trailing_diamond": "\ue0b0",
                "type": "path"
              },
              {
                "background": "#280C2E",
                "background_templates": [
                  "{{ if or (.Working.Changed) (.Staging.Changed) }}#7621DE{{ end }}",
                  "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#7621DE{{ end }}",
                  "{{ if gt .Ahead 0 }}#7621DE{{ end }}",
                  "{{ if gt .Behind 0 }}#7621DE{{ end }}"
                ],
                "foreground": "#FFFFFF",
                "powerline_symbol": "\ue0b0",
                "properties": {
                  "fetch_stash_count": true,
                  "fetch_status": true,
                  "fetch_upstream_icon": true
                },
                "style": "powerline",
                "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",
                "type": "git"
              },
              {
                "background": "#910000",
                "foreground": "#ffffff",
                "leading_diamond": "<transparent,background>\ue0b0</>",
                "style": "diamond",
                "template": "<transparent> \uf12a</> {{ reason .Code }} ",
                "trailing_diamond": "\ue0b0",
                "type": "status"
              }
            ],
            "type": "prompt"
          }
        ],
        "console_title_template": "{{if .Root}} \u26a1 {{end}}{{.Folder | replace \"~\" \"🏠\"}} @ {{.HostName}}",
        "final_space": true,
        "version": 2
      }
    '';
  };
}
