{ inputs, lib, config, pkgs, ... }:
let
  ws1 = "1: www";
  ws2 = "2: code";
  ws3 = "3: discord";
  ws4 = "4: games";
  ws5 = "5: book";
  ws6 = "6: six";
  ws7 = "7: seven";
  ws8 = "8: music";
  ws9 = "9: nine";

  alt = "Mod1";
in {
  imports = [
    ./base.nix
    ./i3.nix
  ];

  xsession.windowManager.i3.config = {
    startup = [
      {
        command = "\"pkill polybar; polybar -c ~/.config/polybar/kiwi.ini laptop\"";
        always = true;
        notification = false;
      }
    ];

    keybindings = {
      "${alt}+u" = "workspace ${ws1}";
      "${alt}+o" = "workspace ${ws2}";
      "${alt}+i" = "workspace ${ws3}";
      "${alt}+p" = "workspace ${ws4}";
      "${alt}+comma" = "workspace ${ws5}";
      "${alt}+period" = "workspace ${ws6}";
      "${alt}+y" = "workspace ${ws8}";

      "${alt}+Shift+u" = "move container to workspace ${ws1}";
      "${alt}+Shift+o" = "move container to workspace ${ws2}";
      "${alt}+Shift+i" = "move container to workspace ${ws3}";
      "${alt}+Shift+p" = "move container to workspace ${ws4}";
      "${alt}+Shift+comma" = "move container to workspace ${ws5}";
      "${alt}+Shift+period" = "move container to workspace ${ws6}";
      "${alt}+Shift+y" = "move container to workspace ${ws8}";
    };
  };
}