{ pkgs }:

let

  imgLink = "https://raw.githubusercontent.com/nklsch/nixos-config/main/modules/wallpaper/moon.jpg";
  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "13e62f4d2c43cb35a2c3160b16628ea2ef310747f25c36a5d8bb4f950afa75c3";
  };

in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
      sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/
      rm Background.jpg
      cp -r ${image} $out/Background.jpg
    '';
  }
