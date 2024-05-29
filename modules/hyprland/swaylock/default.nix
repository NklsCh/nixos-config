{ username, ... }:
{
  home-manager.users.${username} = _: {
  home.file = {
    ".config/swaylock/config".text = ''
      color=303446
      bs-hl-color=f2d5cf
      caps-lock-bs-hl-color=f2d5cf
      caps-lock-key-hl-color=a6d189
      inside-color=00000000
      inside-clear-color=00000000
      inside-caps-lock-color=00000000
      inside-ver-color=00000000
      inside-wrong-color=00000000
      key-hl-color=a6d189
      layout-bg-color=00000000
      layout-border-color=00000000
      layout-text-color=c6d0f5
      line-color=00000000
      line-clear-color=00000000
      line-caps-lock-color=00000000
      line-ver-color=00000000
      line-wrong-color=00000000
      ring-color=babbf1
      ring-clear-color=f2d5cf
      ring-caps-lock-color=ef9f76
      ring-ver-color=8caaee
      ring-wrong-color=ea999c
      separator-color=00000000
      text-color=c6d0f5
      text-clear-color=f2d5cf
      text-caps-lock-color=ef9f76
      text-ver-color=8caaee
      text-wrong-color=ea999c
    '';
  };
  };
}
