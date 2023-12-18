{ pkgs, ... }: {
  home.packages = with pkgs; [
    solaar
    kitty
    alacritty
    xdotool
    lxappearance
    baobab
    nitrogen
    mpv
    feh
    zathura
    playerctl
    spotify
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        yzhang.markdown-all-in-one
        bbenoist.nix
        svelte.svelte-vscode
        vscodevim.vim
        enkia.tokyo-night
      ];
    })
  ];
}
