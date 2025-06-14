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
  ];

  programs.firefox.webapps.superlist = {
    url = "https://app.superlist.com";
    id = 1;

    backgroundColor = "#232233";

    comment = "Home to all your lists.";
    genericName = "Todo Manager";
    categories = [];
  };

  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0"];
}
