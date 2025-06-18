{ pkgs, nixpkgs, ... }: {
  home.packages = with pkgs; [
    gimp
    xfce.thunar
    darktable
    godot_4
    protonvpn-gui
    _1password-gui
    signal-desktop
    discord
    zoom-us
    prusa-slicer
    itch
    blender
    obsidian
    # butler: broken
    yt-dlp
    lutris
    cemu
    todoist-electron
    zed-editor
    aseprite
    vlc
  ];

  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0"];
}
