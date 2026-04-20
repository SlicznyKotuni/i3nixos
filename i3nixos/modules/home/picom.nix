{ ... }:

{
  # Picom – zaokrąglenia, blur, cienie
  # UWAGA: Na VirtualBox może potrzebować wyłączenia blura (brak GPU)
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 3;
    fadeSteps = [ 0.04 0.04 ];
    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowOpacity = 0.6;
    settings = {
      corner-radius = 12;
      rounded-corners-exclude = [
        "class_g = 'Polybar'"
        "class_g = 'i3lock'"
      ];
      blur = {
        method = "dual_kawase";
        strength = 5;
      };
      blur-background-exclude = [
        "class_g = 'Polybar'"
        "class_g = 'i3lock'"
      ];
    };
  };
}
