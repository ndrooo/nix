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
    # openscad : linker issue
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        yzhang.markdown-all-in-one
        ms-python.python
        ms-python.debugpy
        ms-python.black-formatter
        bbenoist.nix
        jnoortheen.nix-ide
        geequlim.godot-tools
        svelte.svelte-vscode
        esbenp.prettier-vscode
        vscodevim.vim
        enkia.tokyo-night
        mkhl.direnv
        vadimcn.vscode-lldb
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "openscad-language-support";
          publisher = "Leathong";
          version = "2.0.1";
          sha256 = "sha256-GTvn97POOVmie7mOD/Q3ivEHXmqb+hvgiic9pTWYS0s=";
        }
      ];
    })
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "image/png" = "feh.desktop";
      "image/jpeg" = "feh.desktop";
      "application/pdf" = "firefox.desktop";
      "x-scheme-handler/sgnl" = "signal.desktop";
      "x-scheme-handler/signalcaptcha" = "signal.desktop";
    };
  };
}
