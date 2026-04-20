{ pkgs, ... }:

{
  # Rozrywka i eyecandy
  home.packages = with pkgs; [
    cbonsai        # bonsai w terminalu
    cmatrix        # efekt Matrix
    pipes-rs       # animowane rury (Rust)
    hollywood      # hacker screen
    genact         # fake aktywność
    peaclock       # terminalowy zegar
  ];
}
