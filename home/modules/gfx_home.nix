{ pkgs, nixpkgs, ... }: {
  home.packages = with pkgs; [
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
    blender
    obsidian
  ];

  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0"];
}
