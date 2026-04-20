{ pkgs, ... }:

{
  # ZSH + Oh My Zsh + Starship
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      fastfetch
    '';

    shellAliases = {
      # ── Listowanie (eza) ──────────────────
      ll   = "eza -la --icons --group-directories-first";
      ls   = "eza --icons --group-directories-first";
      la   = "eza -la --icons --group-directories-first";
      lt   = "eza --tree --icons --level=2";
      ltt  = "eza --tree --icons --level=3";
      lg   = "lazygit";

      # ── Kot = bat ─────────────────────────
      cat  = "bat --style=plain";
      catt = "bat";                  # z numeracją, highlight
      less = "bat --paging=always";

      # ── Nawigacja ─────────────────────────
      ".."    = "cd ..";
      "..."   = "cd ../..";
      "...."  = "cd ../../..";
      "....." = "cd ../../../..";
      cfg     = "cd /etc/nixos/i3nixos";
      docs    = "cd ~/Documents";
      dl      = "cd ~/Downloads";
      shared  = "cd /mnt/shared";
      notes   = "cd ~/Documents/Obsidian";

      # ── NixOS / nh ────────────────────────
      rebuild = "nh os switch /etc/nixos/i3nixos";
      update  = "nh os switch --update /etc/nixos/i3nixos";
      test    = "nh os test /etc/nixos/i3nixos";
      boot    = "sudo nixos-rebuild boot --flake /etc/nixos/i3nixos#i3nixos";
      clean   = "nh clean all --keep 5";
      search  = "nh search";
      gens    = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

      # ── Git ───────────────────────────────
      g   = "git";
      gs  = "git status -sb";
      gp  = "git push";
      gl  = "git pull";
      gc  = "git commit -m";
      gca = "git commit -am";
      gco = "git checkout";
      gcb = "git checkout -b";
      gd  = "git diff";
      ga  = "git add";
      gaa = "git add --all";
      glog = "git log --oneline --graph --decorate";

      # ── System ────────────────────────────
      off = "systemctl poweroff";
      rbt = "systemctl reboot";
      sus = "systemctl suspend";

      # ── Szukanie / narzędzia ──────────────
      rga   = "rga";
      find  = "fd";
      top   = "btop";
      du    = "gdu";
      df    = "df -h";
      free  = "free -h";
      weather = "curl wttr.in/Legnica";
      myip   = "curl ifconfig.me";

      # ── Audio / media ────────────────────
      vol   = "pactl set-sink-volume @DEFAULT_SINK@";  # vol +5%
      mute  = "pactl set-sink-mute @DEFAULT_SINK@ toggle";

      # ── Udział Windows ───────────────────
      mount-win = "sudo mount /mnt/shared";

      # ── Flatpak Opera ────────────────────
      opera = "flatpak run com.opera.Opera";

      # ── Historia / tmux / zellij ─────────
      hg  = "history | grep";
      zj  = "zellij";

      # ── Fun ──────────────────────────────
      neofetch = "fastfetch";
      matrix   = "cmatrix";
      bonsai   = "cbonsai --live --infinite";

      # ── Inwentaryzacja ──────────────────
      list-pkgs   = "ls ~/.nix-profile/bin/ 2>/dev/null | sort";
      list-system = "ls /run/current-system/sw/bin/ | sort";
      list-flats  = "flatpak list --app";
      list-all    = "report-packages";
      cs          = "cheatsheet";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "z" "docker" "fzf" "command-not-found" ];
      theme = "";
    };
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      format = "[░▒▓](#cc2936)[ 󰊠 ](bg:#cc2936 fg:#0a0a0a)[](bg:#252525 fg:#cc2936)$directory[](fg:#252525) $git_branch$git_status$character";
      directory = {
        format = "[ $path ]($style)";
        style = "bg:#252525 fg:#c8c0b8";
        truncation_length = 3;
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
        style = "fg:#cc2936";
      };
      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "fg:#ff4444";
      };
      character = {
        success_symbol = "[❯](#cc2936)";
        error_symbol = "[❯](#ff4444)";
      };
    };
  };

  # Zoxide – smart cd
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];  # zastępuje 'cd' całkowicie
  };

  # Direnv
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # FZF
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--color=bg+:#151515,bg:#0a0a0a,spinner:#cc2936,hl:#cc2936"
      "--color=fg:#c8c0b8,header:#cc2936,info:#ff4444,pointer:#ff4444"
      "--color=marker:#ff4444,fg+:#c8c0b8,prompt:#cc2936,hl+:#ff4444"
      "--border=rounded"
    ];
  };

  # Bash fallback (też dostaje aliasy podstawowe)
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -la --icons --group-directories-first";
      ls = "eza --icons --group-directories-first";
      cat = "bat --style=plain";
      rebuild = "nh os switch /etc/nixos/i3nixos";
    };
  };
}
