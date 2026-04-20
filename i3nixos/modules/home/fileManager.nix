{ pkgs, ... }:

{
  # Yazi – nowoczesny menedżer plików (Rust)
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    shellWrapperName = "y";  # nowy default (było "yy")
  };

  home.packages = with pkgs; [
    ranger       # starszy TUI manager (do porównania z yazi)
    ueberzugpp   # obrazki w terminalu (dla rangera/yazi)
  ];
}
