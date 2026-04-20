{ config, pkgs, lib, ... }:

let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      terminal = "alacritty";
      menu = "rofi -show drun";

      gaps = {
        inner = 8;
        outer = 4;
        smartGaps = true;
      };

      keybindings = lib.mkOptionDefault {
        # ── Podstawy ────────────────────────
        "${mod}+Return"     = "exec alacritty";
        "${mod}+d"          = "exec rofi -show drun";
        "${mod}+Shift+d"    = "exec rofi -show run";
        "${mod}+Tab"        = "exec rofi -show window";  # przełącznik okien
        "${mod}+Shift+q"    = "kill";
        "${mod}+f"          = "fullscreen toggle";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space"      = "focus mode_toggle";

        # ── Nawigacja (vim-style) ──────────
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # ── Strzałki (alternatywnie) ───────
        "${mod}+Left"  = "focus left";
        "${mod}+Down"  = "focus down";
        "${mod}+Up"    = "focus up";
        "${mod}+Right" = "focus right";

        # ── Workspace 1–9 ──────────────────
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";

        # Szybki skok pomiędzy ostatnimi workspace'ami
        "${mod}+grave" = "workspace back_and_forth";

        # ── Layout ─────────────────────────
        "${mod}+v"       = "split vertical";
        "${mod}+b"       = "split horizontal";
        "${mod}+s"       = "layout stacking";
        "${mod}+w"       = "layout tabbed";
        "${mod}+e"       = "layout toggle split";
        "${mod}+r"       = "mode resize";
        "${mod}+Shift+r" = "reload";           # przeładuj config
        "${mod}+Shift+c" = "restart";          # restart i3 (bez re-logowania)

        # ── Aplikacje (szybki dostęp) ──────
        "${mod}+o"        = "exec obsidian";              # Obsidian
        "${mod}+Shift+o"  = "exec flatpak run com.opera.Opera"; # Opera
        "${mod}+z"        = "exec alacritty -e zellij";   # Zellij
        "${mod}+Shift+b"  = "exec zen-beta";              # Zen Browser
        "${mod}+n"        = "exec alacritty -e nvim";     # nvim
        "${mod}+m"        = "exec alacritty -e cmus";     # muzyka
        "${mod}+y"        = "exec alacritty -e yazi";     # pliki w terminalu
        "${mod}+Shift+e"  = "exec thunar";                # menedżer plików GUI
        "${mod}+Shift+s"  = "exec flameshot gui";         # screenshot

        # ── Lock / Power ───────────────────
        "${mod}+Escape"        = "exec loginctl lock-session";
        "${mod}+Shift+x"       = "exec loginctl lock-session";
        "${mod}+Shift+Escape"  = "exec shutdown now";
        "${mod}+Shift+BackSpace" = "exec systemctl reboot";

        # ── Głośność ───────────────────────
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute"        = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute"     = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        # ── Media ──────────────────────────
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        # ── Jasność ────────────────────────
        "XF86MonBrightnessUp"   = "exec brightnessctl set 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

        # ── Scratchpad ─────────────────────
        "${mod}+minus"       = "scratchpad show";
        "${mod}+Shift+minus" = "move scratchpad";

        # ── Variety (zmiana tapety) ────────
        "${mod}+Shift+n" = "exec variety --next";    # next wallpaper
        "${mod}+Shift+p" = "exec variety --previous"; # previous wallpaper

        # ── Polybar toggle ─────────────────
        "${mod}+Shift+m" = "exec polybar-msg cmd toggle";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 10 px or 10 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";
          "Left"  = "resize shrink width 10 px or 10 ppt";
          "Down"  = "resize grow height 10 px or 10 ppt";
          "Up"    = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";
          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      window = {
        titlebar = false;
        border = 2;
      };

      # Reguły okien (floating dla niektórych aplikacji)
      floating = {
        criteria = [
          { class = "Pavucontrol"; }
          { class = "Lxappearance"; }
          { class = "Blueman-manager"; }
          { class = "Variety"; }
          { title = "Picture-in-Picture"; }
        ];
      };

      # Startup
      startup = [
        { command = "nm-applet"; notification = false; }
        { command = "dunst"; notification = false; }
        # Variety – czekamy 3s aż X się ustabilizuje, potem startujemy
        { command = "sh -c 'sleep 3 && variety'"; notification = false; }
        { command = "flameshot"; notification = false; }
        { command = "udiskie --tray"; notification = false; }
        # Stwórz potrzebne katalogi
        { command = "mkdir -p $HOME/Pictures $HOME/Pictures/Wallpapers"; notification = false; }
      ];

      bars = [];
    };

    extraConfig = ''
      exec_always --no-startup-id $HOME/.config/polybar/launch.sh
    '';
  };

  # Rofi
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
  };

  # Katalogi dla Variety
  home.file."Pictures/.keep".text = "";
  home.file."Pictures/Wallpapers/.keep".text = "";

  # Variety – skrypt który doda źródła przy pierwszym starcie
  # (nie nadpisujemy całego configu, tylko dodajemy źródła jeśli ich brak)
  home.file.".config/variety/sources-setup.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      # Uruchom raz po instalacji żeby skonfigurować źródła Variety
      CONF=~/.config/variety/variety.conf
      if [ -f "$CONF" ] && ! grep -q "sources = .*wallhaven" "$CONF"; then
        # Dopisz źródła na końcu sekcji
        cat >> "$CONF" << 'SRCEOF'

# Custom sources (dodane przez nixos config)
sources = flickr|Use user-defined|user:atr
sources = wallhaven|space dark red|
sources = wallhaven|cyberpunk red|
sources = wallhaven|nebula|
SRCEOF
        echo "✅ Variety sources dodane. Restart: pkill variety && variety &"
      else
        echo "ℹ️  Config Variety jeszcze nie istnieje lub źródła już są"
      fi
    '';
  };
}
