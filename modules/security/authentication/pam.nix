{ displayManager, ... }:
{
  security.pam.services.${displayManager}.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
