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
    logseq
    # butler: broken
    zed-editor
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
