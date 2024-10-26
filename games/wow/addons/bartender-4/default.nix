{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "4.15.1";
    name = "bartender-4";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "13501";
      file = "5754478";
      hash = "sha256-IAvdnNTqA14GEhicy7gzue33KxVGKPo38yS8semmWCc=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv Bartender4 $out/
    '';
  };
in {
  home.file.wowaddons-bartender-4 = {
    source = "${addon}/Bartender4";
    target = "games/addons/Bartender4";
  };
}
