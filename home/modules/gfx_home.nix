{ pkgs, nixpkgs, pkgs-stable, ... }: {
  home.packages = [
    pkgs.gimp
    pkgs.xfce.thunar
    pkgs-stable.darktable
    pkgs.godot_4
    pkgs.protonvpn-gui
    pkgs._1password-gui
    pkgs.signal-desktop
    pkgs.discord
    pkgs.slack
    pkgs.zoom-us
    pkgs.prusa-slicer
    pkgs.itch
    pkgs.blender
    pkgs.inkscape
    pkgs.obsidian
    pkgs.butler
    pkgs.yt-dlp
    # pkgs.cemu - https://github.com/NixOS/nixpkgs/issues/449394
    pkgs.todoist-electron
    pkgs.zed-editor
    pkgs.aseprite
    pkgs.vlc
  ];

  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0"];
}
