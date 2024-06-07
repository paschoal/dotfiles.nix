{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-weakauras";
    version = "5.13.2";
    src = fetchurl {
      url = "https://github.com/WeakAuras/WeakAuras2/releases/download/${version}/WeakAuras-${version}.zip";
      sha256 = "sha256-L7E4gstszIWjTXB4uxs9HPRtLiMVEGu27Mr/jeUii44=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv WeakAuras $out/
      mv WeakAurasArchive $out/
      mv WeakAurasModelPaths $out/
      mv WeakAurasOptions $out/
      mv WeakAurasTemplates $out/
    '';
  };
  in {
    home.file.wowaddons-weakauras = {
      source = "${addon}/WeakAuras";
      target = "games/addons/WeakAuras";
    };

    home.file.wowaddons-weakauras-archive = {
      source = "${addon}/WeakAurasArchive";
      target = "games/addons/WeakAurasArchive";
    };

    home.file.wowaddons-weakauras-model-paths = {
      source = "${addon}/WeakAurasModelPaths";
      target = "games/addons/WeakAurasModelPaths";
    };

    home.file.wowaddons-weakauras-options = {
      source = "${addon}/WeakAurasOptions";
      target = "games/addons/WeakAurasOptions";
    };

    home.file.wowaddons-weakauras-templates = {
      source = "${addon}/WeakAurasTemplates";
      target = "games/addons/WeakAurasTemplates";
    };
}
