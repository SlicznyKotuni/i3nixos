{ pkgs, ... }:

{
  # Flatpak – dla aplikacji których nie ma w nixpkgs (np. Opera)
  services.flatpak.enable = true;

  # XDG portals – wymagane przez flatpak do wielu rzeczy (file picker, notyfikacje itp.)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  # Po rebuildzie zrób raz:
  #   flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  #   flatpak install flathub com.opera.Opera
  #
  # Deklaratywnie przez nix-flatpak (opcjonalnie, ale wymaga extra flake input):
  #   https://github.com/gmodena/nix-flatpak
}
