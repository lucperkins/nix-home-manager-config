{
  enable = true;

  settings = {
    env.TERM = "xterm-256color";

    window.padding = {
      x = 10;
      y = 10;
    };

    window.decorations = "none";

    window.startup_mode = "Fullscreen";

    scrolling = {
      history = 10000;
      multiplier = 3;
    };

    draw_bold_text_with_bright_colors = true;

    background_opacity = 0.95;

    key_bindings = [
      {
        key = "V";
        mods = "Control|Shift";
        action = "Paste";
      }
      {
        key = "C";
        mods = "Control|Shift";
        action = "Copy";
      }
      {
        key = "Up";
        mods = "Control|Shift";
        action = "ScrollPageUp";
      }
      {
        key = "Down";
        mods = "Control|Shift";
        action = "ScrollPageDown";
      }
    ];
  };
}