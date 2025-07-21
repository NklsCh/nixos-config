{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
  ];

  programs.chromium = {
    enable = true;
    extraOpts = {
      "AudioSandboxEnabled" = false;
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "BlockThirdPartyCookies" = true;
      "BraveAIChatEnabled" = 0; # Disable Brave AI Chat
      "BraveNewsDisabled" = 1; # Disable Brave News
      "BraveRewardsDisabled" = 1; # Disable Brave Rewards
      "BraveTalkDisabled" = 1; # Disable Brave Talk
      "BraveVPNDisabled" = 1; # Disable Brave VPN
      "BraveWalletDisabled" = 1; # Disable Brave Wallet
      "DefaultSearchProviderEnabled" = true;
      "RestoreOnStartup" = 4; # Restore specified pages
      "RestoreOnStartupURLs" = [ "https://start.v3rm1n.dev" ];
      #"DefaultSearchProviderName" = "Startpage";
      #"DefaultSearchProviderSearchURL" = "https://www.startpage.com/do/search?query={searchTerms}";
      #"DefaultSearchProviderSuggestURL" = "https://www.startpage.com/do/search?query={searchTerms}";
      "MetricsReportingEnabled" = false;
      "PasswordManagerEnabled" = false;
      "SafeBrowsingExtendedReportingEnabled" = false;
    };
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "enamippconapkdmgfgjchkhakpfinmaj" # DeArrow
      "lpcaedmchfhocbbapmcbpinfpgnhiddi" # Google Keep
      "oldceeleldhonbafppcapldpdifcinji" # LanguageTool
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
      "ponfpcnoihfmfllpaingbgckeeldkhle" # YouTube Enhancer
    ];
  };
}
