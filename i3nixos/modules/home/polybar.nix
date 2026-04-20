{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
    script = "";
    config = {
      "colors" = {
        background     = "#dd0a0a0a";
        background-alt = "#dd252525";
        foreground     = "#c8c0b8";
        foreground-alt = "#5a5a5a";
        red            = "#cc2936";
        red-bright     = "#ff4444";
        red-dim        = "#8b1a1a";
      };

      "bar/main" = {
        width = "100%";
        height = "32px";
        radius = "0";
        bottom = true;
        fixed-center = true;
        background = "\${colors.background}";
        foreground = "\${colors.foreground}";
        padding-left = 2;
        padding-right = 2;
        module-margin = 1;
        font-0 = "ShureTechMono Nerd Font Mono:size=11;3";
        font-1 = "ShureTechMono Nerd Font Mono:size=14;4";
        modules-left = "i3";
        modules-center = "date";
        modules-right = "filesystem cpu memory pulseaudio network";
        border-bottom-size = "2px";
        border-bottom-color = "\${colors.red}";
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;
        strip-wsnumbers = true;
        index-sort = true;
        enable-click = true;
        format = "<label-state> <label-mode>";
        label-mode = " %mode% ";
        label-mode-background = "\${colors.red-bright}";
        label-mode-padding = 1;
        label-focused = " %index% ";
        label-focused-foreground = "\${colors.red-bright}";
        label-focused-background = "\${colors.background-alt}";
        label-focused-underline = "\${colors.red}";
        label-focused-padding = 1;
        label-unfocused = " %index% ";
        label-unfocused-foreground = "\${colors.foreground-alt}";
        label-unfocused-padding = 1;
        label-urgent = " %index% ";
        label-urgent-background = "\${colors.red}";
        label-urgent-padding = 1;
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 3;
        format-prefix = "  ";
        format-prefix-foreground = "\${colors.red}";
        label = "%percentage:2%%";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 5;
        format-prefix = "  ";
        format-prefix-foreground = "\${colors.red}";
        label = "%percentage_used:2%%";
      };

      "module/filesystem" = {
        type = "internal/fs";
        mount-0 = "/";
        interval = 30;
        format-mounted-prefix = " 󰋊 ";
        format-mounted-prefix-foreground = "\${colors.red}";
        label-mounted = "%percentage_used%%";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%d.%m.%Y";
        time = "%H:%M:%S";
        format-prefix = "  ";
        format-prefix-foreground = "\${colors.red}";
        label = "%date%  %time%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        use-ui-max = false;
        format-volume = "<ramp-volume> <label-volume>";
        label-volume = "%percentage%%";
        label-muted = " 婢 muted";
        label-muted-foreground = "\${colors.foreground-alt}";
        ramp-volume-0 = " ";
        ramp-volume-1 = " ";
        ramp-volume-2 = " ";
        ramp-volume-foreground = "\${colors.red}";
      };

      "module/network" = {
        type = "internal/network";
        interface-type = "wired";
        interval = 5;
        format-connected-prefix = "  ";
        format-connected-prefix-foreground = "\${colors.red}";
        label-connected = "%local_ip%";
        format-disconnected-prefix = "  ";
        format-disconnected-prefix-foreground = "\${colors.red-dim}";
        label-disconnected = "offline";
        label-disconnected-foreground = "\${colors.foreground-alt}";
      };
    };
  };

  home.file.".config/polybar/launch.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      killall -q polybar
      while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
      polybar main 2>&1 | tee -a /tmp/polybar.log & disown
    '';
  };
}
