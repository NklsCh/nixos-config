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
      ../../modules/dotfiles/packages/hyprland/hyprland.nix
      ../../modules/dotfiles/packages/devenv/dev.nix
      ../../modules/dotfiles/packages/text/text.nix
      ../../modules/dotfiles/rclone/rclone.nix
    ];

  # ========== Home-Manager =========== #

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

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
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


  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  }; 

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.ly = {
    enable = true;
  };
  # services.xserver.desktopManager.plasma5.enable = true;


  # Configure keymap in X11
  # services.xserver = {
  #   layout = "de";
  #   xkbVariant = "";
  # };

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
  users.users.choinowski = {
    isNormalUser = true;
    description = "Choinowski";
    extraGroups = [ "networkmanager" "wheel" ];
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



  # ========== Packages ==========

  # Enable flatpak packages
  services.flatpak.enable = true;
  
  # Global Packages for all users
  environment.systemPackages = 
  (with pkgs; [
      git
      brave
      discord
      bitwarden
      unzip
      home-manager
      oh-my-posh
      teams-for-linux
    ])

  ++

    (with pkgs-unstable; [
      nh
      nix-output-monitor
      warp-terminal
  ]);

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
