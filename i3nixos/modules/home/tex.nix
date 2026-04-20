{ pkgs, ... }:

{
  home.packages = with pkgs; [
    typst                # nowoczesny TeX
    typst-live           # live preview dla Typst
    texliveFull          # pełny TeX (dla TeXstudio)
    texstudio            # edytor TeX
    pandoc               # konwersje dokumentów
    mermaid-cli          # diagramy z markdown
  ];
}
