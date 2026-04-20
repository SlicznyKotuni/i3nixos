{ pkgs, inputs, ... }:

{
  # Opera została usunięta z nixpkgs (brak maintainera)
  # → instalujemy przez Flatpak (patrz modules/system/flatpak.nix)
  # Po pierwszym rebuildzie: flatpak install flathub com.opera.Opera

  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta
  ];
}
