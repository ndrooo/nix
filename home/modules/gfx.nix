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
        mkhl.direnv
        vadimcn.vscode-lldb
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "godot-tools";
          publisher = "geequlim";
          version = "1.3.1";
          sha256 = "wJICDW8bEBjilhjhoaSddN63vVn6l6aepPtx8VKTdZA=";
        }
      ];
    })
  ];
}
