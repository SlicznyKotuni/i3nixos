{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mpv           # odtwarzacz wideo (główny)
    vlc           # odtwarzacz + konwersje
    cmus          # TUI muzyka (must-have)
    musikcube     # TUI muzyka (do testów)
    ytfzf         # YouTube CLI z fzf
    yt-dlp        # downloader (backend dla ytfzf)
  ];
}
