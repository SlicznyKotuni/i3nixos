{ pkgs, ... }:

{
  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    # Adoptujemy nowe defaulty (od NixOS 26.05)
    withRuby = false;
    withPython3 = false;
  };
}
