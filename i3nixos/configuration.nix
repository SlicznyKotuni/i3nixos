{ config, pkgs, inputs, ... }:

{
  # Flakes + unfree
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Sieć
  networking.hostName = "i3nixos";
  networking.networkmanager.enable = true;

  # Strefa czasowa i lokalizacja
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";
  console.keyMap = "pl2";

  # Użytkownik
  users.users.atr = {
    isNormalUser = true;
    description = "atr";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
  };

  # ZSH – włączamy na poziomie systemu, bo jest shell'em użytkownika
  programs.zsh.enable = true;

  # PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Podstawowe pakiety systemowe (reszta w modułach/home.nix)
  environment.systemPackages = with pkgs; [
    git
    vim
    btop
    cifs-utils
    playerctl
    brightnessctl
    xclip
    networkmanagerapplet
    pavucontrol
    lxappearance
  ];

  system.stateVersion = "25.05";
}
