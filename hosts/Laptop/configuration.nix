# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # ========== Import =========== #

  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager

      # ========= Core Packages ========= #
      ../../modules/packages/core/core.nix

      # ========= Packages ========= #
      ../../modules/packages/hyprland/hyprland.nix
      ../../modules/packages/devenv/dev.nix
      ../../modules/packages/text/text.nix
      ../../modules/packages/school/school.nix
      ../../modules/packages/waybar/waybar.nix

      # ========= Configs ========= #
      ../../modules/core/programms/rclone/rclone.nix
    ];

  # ========== Home-Manager ========== #

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      choinowski = import ./home.nix;
    };
  };

  # ========== Bootloader ========== #

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      gfxmodeBios = "1920x1080";
      gfxmodeEfi = "1920x1080";
    };
  };

  networking.hostName = "Laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Nix Experimental Features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # ========== Locales and Timezone ========== #
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };


  # ========= Display Manager ========= #

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  }; 

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable X11 and sddm as greeter 
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
    displayManager = {
      sddm = { 
        enable = true;
        wayland.enable = true;
        theme = "${import ../../modules/hyprland/sddm/sddm.nix { inherit pkgs; }}";
      };
      autoLogin = {
        enable = true;
        user = "choinowski";
      };
    };
  };

  # Enable gnome keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; 
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.choinowski = {
      isNormalUser = true;
      description = "Choinowski";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # List of Fonts
  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = ["JetBrainsMono"];})
  ];

  # Enable automatic login for the user.
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "choinowski";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;



  # ========== Packages ========== #

  # Enable flatpak packages
  services.flatpak.enable = true;
  

  environment.sessionVariables = {
    FLAKE = "/etc/nixos";
    NIXOS_OZONE_WL = "1";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  environment.variables.EDITOR = "nvim";
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
