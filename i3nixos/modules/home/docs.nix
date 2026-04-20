{ pkgs, ... }:

{
  # Zathura – PDF viewer
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };

  home.packages = with pkgs; [
    obsidian      # główne notatki (pakiet, nie programs.*)
    zettlr        # markdown IDE (do testów)
    # turtl – BRAK w nixpkgs, usunięte. Alternatywa: Standard Notes lub AppImage
    xournalpp     # notatki odręczne / adnotacje PDF
    sioyek        # research PDF viewer
  ];
}
