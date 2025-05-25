{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
  ];

  programs.chromium = {
    enable = true;
    extraOpts = {
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "BlockThirdPartyCookies" = true;
      "DefaultSearchProviderEnabled" = true;
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
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      # "ghmbeldphafepmbegfdlkpapadhbakde" # Proton Pass
      "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };
}
