{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  imports = [
    ../../config/git
    ../../config/development
    ../../config/zsh
    ../../config/nvim
    ../../config/aws-vault

    ../../games/wow
    ../../games/eve

    ../../config/manufact
    ../../config/qutebrowser/mjolnir
    ../../config/wallpapers

    ../../config/sxhkd/mjolnir/bspwm
    ../../config/bspwm

    ../../config/alacritty
    ../../config/cursor
    ../../config/rofi
    ../../config/mangohud
    ../../config/screenshot/flameshot
    ../../config/clementine
    ../../config/thunderbird
    ../../config/dunst
    ../../config/ranger
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"

    "awscli2"
    "terraform"
    "apple_cursor"
  ];

  home.packages = with pkgs; [
    docker-compose
    bat
    pass
    discord
    vlc
    feh
  ];

  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  xdg.userDirs = {
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/desktop";
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/downloads";
    pictures = "${config.home.homeDirectory}/screenshots";
    publicShare = "${config.home.homeDirectory}/screenshots";
    templates = "${config.home.homeDirectory}/downloads";
    videos = "${config.home.homeDirectory}/downloads";
  };

  screenshots = {
    folder = config.xdg.userDirs.pictures;
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}
