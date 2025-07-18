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
    tidal-hifi
    openscad
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        yzhang.markdown-all-in-one
        bbenoist.nix
        jnoortheen.nix-ide
        svelte.svelte-vscode
        esbenp.prettier-vscode
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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = "feh.desktop";
      "image/jpeg" = "feh.desktop";
      "application/pdf" = "firefox.desktop";
      "x-scheme-handler/sgnl" = "signal.desktop";
      "x-scheme-handler/signalcaptcha" = "signal.desktop";
    };
  };
}
