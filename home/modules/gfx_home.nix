{ pkgs, ... }: {
  home.packages = with pkgs; [
    obsidian
    # todoist-electron
    gimp
    xfce.thunar
    darktable
    godot_4
    protonvpn-gui
    _1password-gui
    signal-desktop
    discord
    notion-app-enhanced
    zoom-us
    prusa-slicer
    # itch: running off an EOLed Electron version?
  ];
}
