{ ... }:
{
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  security.pam.services.hyprlock = {
    text = ''
      auth      required  pam_gnome_keyring.so
      session   required  pam_gnome_keyring.so auto_start
    '';
  };
}
