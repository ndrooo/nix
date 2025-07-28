# Common configuration for any unix-like host with a CLI

{ pkgs, lib, ... }: {
  
  home.packages = with pkgs; [
    wiki-tui
    ripgrep
    zola
    nodejs
    yazi
    exiftool
  ];
  
  programs.git = {
    enable = true;
    aliases = {
      st = "status";
    };
    extraConfig = {
      pull.rebase = true;
    };
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config = {
        show_banner: false
        edit_mode: vi
        hooks: {
          pre_prompt: [{ ||
            if (which direnv | is-empty) {
              return
            }

            direnv export json | from json | default {} | load-env
          }]
        }
        completions: {
          quick: true
          algorithm: "fuzzy"
          external: {
            enable: true
            max_results: 100
            completer: {|spans|
              carapace $spans.0 nushell ...$spans | from json
            }
          }
        }
      }
      alias cat = bat
      alias yz = yazi
    '';
    shellAliases = {
      cat = "bat";
    };
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    extraConfig = ''
      set-option -g status-justify centre
      set-window-option -g window-status-separator " "

      set -g status-style "fg=blue bg=default"

      set-window-option -g status-left ""
      set-window-option -g status-right ""

      set-window-option -g window-status-current-format "#[bg=blue,fg=black] [#I] #{=10:window_name} "
      set-window-option -g window-status-format "#[bg=black,fg=blue] [#I] #{=10:window_name} "
    '';
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa";
      cat = "bat";
      yz = "yazi";
    };
    interactiveShellInit = ''
      set fish_greeting # no more greeting
      fish_vi_key_bindings
      set -gx EDITOR vim
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
      format = lib.concatStrings [
        "$hostname" "$directory"
        "$git_branch" "$git_status" "$git_state"
        "$nix_shell"
        "$cmd_duration"
        "$sudo"
        "$line_break"
        "$jobs" "$battery" "$shell"
        "$character" "$status" " "
      ];
      hostname = {
        format = "[ 󰟀  ]($style inverted)[ $hostname ]($style)";
        style = "white bg:black";
      };
      directory = {
        format = "[   ]($style inverted)[$read_only]($read_only_style inverted)[ $path ]($style)";
        style = "bright-blue bold bg:black";
        read_only = "  ";
        read_only_style = "bright-red bg:black";
      };
      character = {
        format = "$symbol";
        success_symbol = "[ 󰊠  ](bright-cyan bg:black)";
        error_symbol = "[ 󰚌  ](black bg:bright-yellow)";
        vimcmd_symbol = "[ 󰐱  ](bright-cyan bg:black)";
        vimcmd_replace_one_symbol = "[ 󰓡  ](bright-cyan bg:black)";
        vimcmd_replace_symbol = "[ 󰯍  ](bright-cyan bg:black)";
        vimcmd_visual_symbol = "[ 󰒉  ](bright-cyan bg:black)";
      };
      status = {
        disabled = false;
        map_symbol = true;
        symbol = "";
        not_executable_symbol = "[ NEX ]($style)";
        not_found_symbol = "[ NFD ]($style)";
        sigint_symbol = "[ INT ]($style)";
        signal_symbol = "[ SIG ]($style)";
        format = "$symbol";
        style = "bold bright-yellow bg:black";
      };
      git_branch = {
        format = "[  ]($style inverted)[ $branch(:$remote_branch) ]($style)";
        style = "bright-green bg:black";
        ignore_branches = ["main" "master"];
      };
      git_status = {
        format = "[   ]($style inverted)([ $all_status$ahead_behind ]($style))";
        style = "bold bright-purple bg:black";
        conflicted = "Cft";
        ahead = "󰜷";
        behind = "󰜮";
        diverged = "󰹺";
        untracked = "";
        modified = "";
        staged = "󰆼";
        renamed = "󰑕";
        deleted = "󰆴";
      };
      cmd_duration = {
        format = "[ 󱦟 $duration ]($style inverted)";
        style = "yellow bg:black";
      };
      fill.symbol = "╍";
      sudo = {
        disabled = false;
        format = " []($style bg:none) [   ]($style inverted)[]($style bg:none) ";
        style = "red bg:black";
      };
      git_commit.disabled = true;
    };
  };
}
