{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ani-cli        # anime streaming (używa mpv + yt-dlp)
  ];
}
