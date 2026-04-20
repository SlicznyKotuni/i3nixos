{ pkgs, ... }:

{
  # Alacritty – Stylix zarządza kolorami, fontem, opacity
  programs.alacritty.enable = true;

  # Kitty – alternatywa z obsługą obrazków
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      window_padding_width = 8;
      confirm_os_window_close = 0;
    };
  };

  # Zellij – multiplexer (nowoczesny tmux)
  programs.zellij = {
    enable = true;
    enableZshIntegration = false; # nie auto-start, tylko komenda
  };
}
