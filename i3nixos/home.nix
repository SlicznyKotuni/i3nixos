{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./modules/home/i3.nix
    ./modules/home/wallpaper.nix
    ./modules/home/polybar.nix
    ./modules/home/picom.nix
    ./modules/home/dunst.nix
    ./modules/home/shell.nix
    ./modules/home/terminal.nix
    ./modules/home/editor.nix
    ./modules/home/fileManager.nix
    ./modules/home/media.nix
    ./modules/home/browsers.nix
    ./modules/home/docs.nix
    ./modules/home/tex.nix
    ./modules/home/photo.nix
    ./modules/home/office.nix
    ./modules/home/fun.nix
    ./modules/home/weather.nix
    ./modules/home/anime.nix
    ./modules/home/cli.nix
  ];

  home.username = "atr";
  home.homeDirectory = "/home/atr";
  home.stateVersion = "25.05";

  # Git
  programs.git = {
    enable = true;
    settings.user.name = "atr";
    settings.user.email = "atr@i3nixos.local";
  };

  # GTK
  gtk.gtk4.theme = null;
}
