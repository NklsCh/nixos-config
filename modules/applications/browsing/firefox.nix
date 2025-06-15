{ ... }:
{
  programs = {
    firefox = {
      enable = false;
      # package = pkgs.librewolf;
      languagePacks = [
        "de"
        "en-US"
      ];

      # ─── About:config prefs ───────────────────────────────────────────────────────
      preferencesStatus = "locked";
      preferences = {
        "browser.contentblocking.category" = "strict";
        "browser.formfill.enable" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.topsites.contile.enabled" = false;
        "extensions.pocket.enabled" = false;
        # Broken due to "stability issues"
        /*
          "privacy.donottrackheader.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        */
      };
      # ─── Enterprise policies (non‑pref things) ────────────────────────────────────
      policies = {
        DisableAccounts = false;
        DisableFirefoxAccounts = false;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "default-off";
        DontCheckDefaultBrowser = true;
        EnableTrackingProtection = {
          Cryptomining = true;
          Fingerprinting = true;
          Locked = true;
          Value = true;
        };
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        SearchBar = "unified";

        # ─── Search engine config ─────────────────────────────────────────────────────
        # Broken on ESR
        /*
          SearchEngines = {
            Default = "Startpage";
          };
        */

        # ─── Extensions ───────────────────────────────────────────────────────────────
        ExtensionSettings = {
          "*".installation_mode = "allowed";
          # Bitwarden:
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          # DeArrow:
          "deArrow@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/dearrow/latest.xpi";
            installation_mode = "force_installed";
          };
          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };
          # Return YouTube Dislike:
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
            installation_mode = "force_installed";
          };
          # Startpage:
          "{20fc2e06-e3e4-4b2b-812b-ab431220cada}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/startpage-private-search/latest.xpi";
            installation_mode = "force_installed";
          };
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
