# Common configuration for any unix-like host with a CLI

{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "ndrooo";
    userEmail = "git@ndr.ooo";
    aliases = {
      st = "status";
    };
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
      let-env config = {
        show_banner: false
        edit_mode: vi
      }
      alias cat = bat
    '';
    envFile.text = ''
    '';
  };
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # no more greeting
      fish_vi_key_bindings
    '';
    plugins = [
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
    ];
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    settings = {
      character = {
        success_symbol = "💖";
        error_symbol = "💀";
        vimcmd_symbol = "🔮";
        vimcmd_replace_one_symbol = "🔂";
        vimcmd_replace_symbol = "🔁";
        vimcmd_visual_symbol = "📋";
      };
      status = {
        disabled = false;
        map_symbol = true;
        symbol = "";
        not_executable_symbol = "🚫 [NEX](bold red) ";
        not_found_symbol = "🔍 [NFD](bold red) ";
        sigint_symbol = "✋ [INT](bold yellow) ";
        signal_symbol = "🏁 [SIG](bold yellow) ";
        format = "$symbol";
      };
      git_branch.symbol = "🔀 ";
      sudo.disabled = false;
    };
  };
}