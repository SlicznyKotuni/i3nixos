{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wego           # pogoda w terminalu
    tenki          # tty-clock z efektem pogodowym (nie "tenki-sh")
  ];
}
