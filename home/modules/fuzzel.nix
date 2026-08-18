{
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = "VictorMono Nerd Font Mono:size=18";
      terminal = "kitty -e";
      prompt = "\"=> \"";
      use-bold = "yes";
      minimal-lines = "yes";
      horizontal-pad = 20;
      vertical-pad = 20;
      inner-pad = 30;
      lines = 10;
    };
    colors = {
      background = "0a0a0aff";
      text = "ccccccff";
      border = "222222ff";
      match = "3a625bff";
      selection = "151515ff";
      selection-text = "527d8bff";
      selection-match = "b39e75ff";
      prompt = "706b9fff";
      input = "bababaff";
    };
    border = {
      width = 4;
      radius = 0;
    };
  };
}
