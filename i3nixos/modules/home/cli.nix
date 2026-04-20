{ pkgs, ... }:

{
  # Nh – nix helper (ładniejszy rebuild)
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos/i3nixos";
  };

  # Espanso – text expander
  services.espanso = {
    enable = true;
    package = pkgs.espanso;
  };

  # Reszta CLI narzędzi
  home.packages = with pkgs; [
    # Szukanie / nawigacja
    ripgrep
    ripgrep-all        # grep w PDF/docx/zip
    fd                 # lepszy find
    # Narzędzia
    bat                # lepszy cat
    eza                # lepszy ls
    lazygit            # git TUI
    gdu                # szybki analizator dysku
    tldr               # krótkie manuale
    tree
    # Transfer / media
    croc               # transfer plików P2P
    # Fun w terminalu
    fastfetch          # info systemowe
    # Benchmarking
    hyperfine          # benchmarki komend
    # System
    udiskie            # auto-mount USB
    keynav             # sterowanie myszą z klawiatury

    # Skrypt: inwentaryzacja pakietów z rzeczywistego systemu
    (writeShellScriptBin "report-packages" ''
      #!/usr/bin/env bash
      OUT="''${1:-$HOME/Documents/packages-report.md}"
      mkdir -p "$(dirname "$OUT")"

      {
        echo "# 📦 Raport pakietów – $(hostname)"
        echo ""
        echo "*Wygenerowano: $(date '+%Y-%m-%d %H:%M:%S')*"
        echo ""
        echo "## 🏠 Home Manager (binarki użytkownika)"
        echo ""
        echo '```'
        ls ~/.nix-profile/bin/ 2>/dev/null | sort
        echo '```'
        echo ""
        echo "## 🖥️ System (binarki w /run/current-system/sw/bin)"
        echo ""
        echo '```'
        ls /run/current-system/sw/bin/ 2>/dev/null | sort
        echo '```'
        echo ""
        if command -v flatpak &>/dev/null; then
          echo "## 📦 Flatpak"
          echo ""
          echo '```'
          flatpak list --app --columns=application,version,branch 2>/dev/null
          echo '```'
          echo ""
        fi
        echo "## 📚 Szybki start z tymi programami"
        echo ""
        echo "Uruchom \`cheatsheet\` lub \`cs\` by zobaczyć opisy i skróty."
      } > "$OUT"

      echo "✅ Raport zapisany: $OUT"
      echo "   Rozmiar: $(du -h "$OUT" | cut -f1)"
    '')

    # Skrypt: Cheatsheet – nasze programy z opisami i komendami do nauki
    (writeShellScriptBin "cheatsheet" ''
      #!/usr/bin/env bash
      cat << 'EOF'

  📚 CHEATSHEET – Twoje programy użytkowe

╭─ 🗂️  MENEDŻERY PLIKÓW ─────────────────────────────────────╮
│  yazi           TUI, nowoczesny (Rust). Klawisze: q=quit, │
│                 Enter/l=otwórz, h=parent, gg/G=start/end,  │
│                 space=mark, y=yank, d=cut, p=paste         │
│  ranger         TUI klasyczny, podobne vim-like bindsy     │
│  thunar         GUI (Super+Shift+E)                        │
╰────────────────────────────────────────────────────────────╯

╭─ 📝 NOTATKI ───────────────────────────────────────────────╮
│  obsidian       GUI, markdown, linki [[]], Super+O         │
│  zettlr         Alternatywa dla Obsidian                   │
│  nvim           Edytor CLI – :help, :q, dd, yy, p, i       │
│  xournal++      Odręczne notatki, adnotacje PDF            │
╰────────────────────────────────────────────────────────────╯

╭─ 📖 PDF ───────────────────────────────────────────────────╮
│  zathura        vim-like: j/k=scroll, gg/G, /=szukaj       │
│  sioyek         research PDF (hierarchia, linki)           │
╰────────────────────────────────────────────────────────────╯

╭─ ✍️  LaTeX / DOKUMENTY ────────────────────────────────────╮
│  typst          Kompiluj: typst compile doc.typ            │
│  typst-live     Live preview: typst-live doc.typ           │
│  texstudio      GUI dla LaTeX                              │
│  pandoc         pandoc in.md -o out.pdf                    │
│  mmdc           Mermaid: mmdc -i d.mmd -o d.png            │
│  onlyoffice-desktopeditors  Word/Excel kompatybilne         │
╰────────────────────────────────────────────────────────────╯

╭─ 🎬 MEDIA ─────────────────────────────────────────────────╮
│  mpv            j/k=10s, ←/→=5s, f=fullscreen, q=quit      │
│  vlc            GUI, też do konwersji (Media→Convert)      │
│  cmus           c=play/pause, x=stop, b=next, z=prev,      │
│                 /=szukaj, 5=queue, q=quit                  │
│  musikcube      Alternatywa cmus (mniej skrótów do ogarn.) │
│  ytfzf          ytfzf "nazwa" – YouTube z fzf              │
│  yt-dlp         yt-dlp <url> – download                    │
╰────────────────────────────────────────────────────────────╯

╭─ 📷 FOTOGRAFIA ────────────────────────────────────────────╮
│  darktable      RAW editor (Lightroom alternatywa)         │
│  exiftool       exiftool zdj.jpg – metadata                │
│  nsxiv          Viewer: h/l=prev/next, f=fullscreen, q     │
│  shotwell       Organizer zdjęć                            │
╰────────────────────────────────────────────────────────────╯

╭─ 🌐 PRZEGLĄDARKI ──────────────────────────────────────────╮
│  opera          flatpak run com.opera.Opera (alias: opera) │
│  zen-beta       Zen Browser (alias: Super+Shift+B)         │
╰────────────────────────────────────────────────────────────╯

╭─ 🖥️  TERMINAL / SHELL ─────────────────────────────────────╮
│  alacritty      Główny terminal                            │
│  kitty          Alternatywa z obrazkami                    │
│  zellij         Multiplexer – ctrl+p=pane, ctrl+t=tab,     │
│                 ctrl+s=scroll, ctrl+h=resize               │
│  fastfetch      Info o systemie (przy starcie terminala)   │
╰────────────────────────────────────────────────────────────╯

╭─ 🔍 SZUKANIE / NARZĘDZIA CLI ──────────────────────────────╮
│  rg             ripgrep – rg "wzorzec"                     │
│  rga            rg w PDF/docx/zip                          │
│  fd             find – fd "wzorzec"                        │
│  fzf            fuzzy finder – Ctrl+R w terminalu          │
│  bat            cat z highlight (alias: cat)               │
│  eza            ls z ikonami (alias: ls/ll/la/lt)          │
│  zoxide         cd z pamięcią – cd docs (już bywałeś)      │
│  tldr           tldr <komenda> – krótkie przykłady         │
│  gdu            gdu / – interaktywny analizator dysku      │
│  btop           htop++ (alias: top)                        │
│  lazygit        git TUI (alias: lg)                        │
│  croc           croc send plik | croc <kod>                │
│  hyperfine      hyperfine 'cmd1' 'cmd2' – benchmark        │
│  ncdu/gdu       analizatory dysku                          │
│  ueberzugpp     obrazki w terminalu (dla yazi/ranger)      │
╰────────────────────────────────────────────────────────────╯

╭─ 🔧 SYSTEM ────────────────────────────────────────────────╮
│  nh             NixOS helper – nh os switch, nh search     │
│  udiskie        Auto-mount USB (tray icon)                 │
│  flatpak        flatpak install flathub <app>              │
│  espanso        Text expander – :tag→rozwinięcie           │
│  keynav         Mysz klawiaturą (Ctrl+;)                   │
│  variety        Zmieniacz tapet (ikona w tray)             │
│  flameshot      Screenshot (Super+Shift+S)                 │
╰────────────────────────────────────────────────────────────╯

╭─ 🎭 FUN / ROZRYWKA ────────────────────────────────────────╮
│  cbonsai        cbonsai --live --infinite                  │
│  cmatrix        Efekt Matrixa                              │
│  pipes.sh       pipes-rs – kolorowe rury                   │
│  hollywood      Ekran "hackera"                            │
│  genact         Fake aktywność                             │
│  peaclock       Zegar w terminalu                          │
│  wego           Pogoda: wego                               │
│  tenki          Pogoda + zegar                             │
│  ani-cli        ani-cli – anime streaming                  │
╰────────────────────────────────────────────────────────────╯

💡 Wskazówki:
   cheatsheet           Pokaż tę ściągę
   list-all             Wygeneruj raport MD
   tldr <program>       Szybki manual z przykładami
   man <program>        Pełna dokumentacja

EOF
    '')
  ];
}
