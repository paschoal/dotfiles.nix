{ config, pkgs, ... }:
{
  services.dunst.enable = true;
  home.packages = with pkgs; [libnotify];

  xdg.configFile."dunst/dunstrc" = {
    text = ''
      [global]
        origin = bottom-right
        notification_limit = 0
        separator_height = 1
        padding = 8
        horizontal_padding = 8
        frame_width = 1
        frame_color = "#282A36"
        gap_size = 2
        separator_color = frame
        sort = yes
        idle_threshold = 120
        font = Iosevka 14
        dmenu = ${pkgs.rofi}/rofi -d dmenu
        browser = ${pkgs.xdg-utils}/xdg-open

      [urgency_low]
        background = "#282A36"
        foreground = "#BD93F9"
        frame_color = "#BD93F9"
        timeout = 10

      [urgency_normal]
        background = "#282A36"
        foreground = "#F1FA8C"
        frame_color = "#F1FA8C"
        timeout = 10

      [urgency_critical]
        background = "#FF5555"
        foreground = "#282A36"
        frame_color = "#282A36"
        timeout = 0
    '';
  };
}
