{ pkgs, ... }:

{
  home.packages = with pkgs; [
    darktable     # RAW processing
    exiftool      # metadata
    nsxiv         # image viewer (zamiennik sxiv)
    shotwell      # organizer zdjęć
  ];
}
