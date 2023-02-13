# Common configuration for any unix-like host with a CLI

{ pkgs, ... }: {
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
      directory = {
        format = "[   ]($style inverted)[$read_only]($read_only_style inverted)[ $path ]($style)";
        style = "bright-blue bold bg:black";
        read_only = "  ";
        read_only_style = "bright-red bg:black";
      };
      character = {
        success_symbol = "[   ](bright-cyan bg:black)";
        error_symbol = "[ 󰚌  ](bright-cyan bg:black)";
        vimcmd_symbol = "[ 󰘳  ](bright-cyan bg:black)";
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
        style = "bold black bg:yellow";
      };
      git_branch = {
        symbol = " ";
        format = "[ $symbol ]($style inverted)[ $branch(:$remote_branch) ]($style)";
        style = "bright-green bg:black";
      };
      git_status = {
        format = "[ $all_status ]($style inverted)[ $ahead_behind ]($style)";
        style = "bright-red bg:black";
      };
      git_commit.disabled = true;
      sudo.disabled = false;
    };
  };
}