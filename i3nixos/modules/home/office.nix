{ pkgs, ... }:

{
  home.packages = with pkgs; [
    onlyoffice-desktopeditors   # pakiet biurowy (nowa nazwa w nixpkgs)
  ];
}
