{ ... }:

{
  # Dunst – powiadomienia (Stylix zarządza kolorami i fontem)
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 350;
        height = 150;
        offset = "20x50";
        origin = "top-right";
        corner_radius = 10;
        frame_width = 2;
        format = "<b>%s</b>\\n%b";
        icon_position = "left";
        max_icon_size = 48;
        padding = 12;
        horizontal_padding = 15;
      };
      urgency_low.timeout = 5;
      urgency_normal.timeout = 10;
      urgency_critical.timeout = 0;
    };
  };
}
