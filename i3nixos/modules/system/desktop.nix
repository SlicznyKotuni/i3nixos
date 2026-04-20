{ pkgs, ... }:

{
  # X11 + i3
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    windowManager.i3.enable = true;
  };

  # SDDM z motywem Astronaut
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;  # zostajemy na X11
    package = pkgs.kdePackages.sddm;  # qt6 wymagane dla astronaut
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [
      sddm-astronaut
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
  };

  # Wariant motywu Astronaut – "post_apocalyptic_hacker" dla naszego Crimson Void
  # Dostępne warianty: astronaut, black_hole, cyberpunk, hyprland_kath,
  #                    japanese_aesthetic, jake_the_dog, pixel_sakura,
  #                    pixel_sakura_static, post-apocalyptic_hacker, purple_leaves
  environment.variables.SDDM_ASTRONAUT_THEME = "post-apocalyptic_hacker";

  environment.systemPackages = with pkgs; [
    alacritty
    rofi
    polybar
    dunst
    flameshot
    thunar
    feh
    variety
    i3lock-color
    xss-lock
    sddm-astronaut
  ];

  # Czcionki dla SDDM
  fonts.packages = with pkgs; [
    nerd-fonts.shure-tech-mono
  ];

  # xss-lock – auto-lock
  programs.xss-lock = {
    enable = true;
    lockerCommand = toString (pkgs.writeShellScript "lock" ''
      ${pkgs.i3lock-color}/bin/i3lock-color \
        --blur 5 \
        --inside-color=0a0a0a88 \
        --ring-color=cc293688 \
        --line-uses-inside \
        --keyhl-color=ff4444ff \
        --bshl-color=8b1a1aff \
        --separator-color=00000000 \
        --insidever-color=b3303088 \
        --ringver-color=cc2936ff \
        --insidewrong-color=ff444488 \
        --ringwrong-color=8b1a1aff \
        --noinput-text="" \
        --verif-text="..." \
        --wrong-text="!" \
        --time-color=c8c0b8ff \
        --date-color=5a5a5aff \
        --clock \
        --indicator \
        --time-str="%H:%M" \
        --date-str="%d.%m.%Y"
    '');
  };
}
