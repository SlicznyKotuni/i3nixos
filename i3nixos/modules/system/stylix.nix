{ pkgs, ... }:

{
  # Stylix – Crimson Void (czarno-czerwony monochromatyczny motyw)
  stylix = {
    enable = true;
    base16Scheme = {
      scheme = "Crimson Void";
      author = "atr";
      base00 = "0a0a0a"; # tło – głęboka czerń
      base01 = "151515"; # tło jaśniejsze
      base02 = "252525"; # zaznaczenie
      base03 = "3a3a3a"; # komentarze
      base04 = "5a5a5a"; # ciemny tekst
      base05 = "c8c0b8"; # domyślny tekst
      base06 = "e0d8d0"; # jasny tekst
      base07 = "f0e8e0"; # najjaśniejszy
      base08 = "cc2936"; # czerwony – główny akcent
      base09 = "a3222b"; # ciemny czerwony
      base0A = "e05a47"; # pomarańczo-czerwony
      base0B = "8b1a1a"; # ciemny bordo
      base0C = "d4443b"; # różo-czerwony
      base0D = "b33030"; # średni czerwony
      base0E = "ff4444"; # jasny czerwony
      base0F = "6b1515"; # najciemniejszy bordo
    };
    image = ../../wallpaper.jpg;
    polarity = "dark";
    opacity = {
      terminal = 0.88;
      applications = 0.95;
      desktop = 0.9;
      popups = 0.92;
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.shure-tech-mono;
        name = "ShureTechMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.shure-tech-mono;
        name = "ShureTechMono Nerd Font";
      };
      sizes = {
        applications = 10;
        terminal = 13;
      };
    };
  };
}
