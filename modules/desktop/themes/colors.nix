{
  config,
  options,
  lib,
  ...
}: let
  colorType =
    lib.types.addCheck lib.types.str (x: !isNull (builtins.match "#[0-9a-fA-F]{6}" x));
  color = defaultColor:
    lib.mkOption {
      type = colorType;
      default = defaultColor;
    };
in {
  options.modules.desktop.themes.colors = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    # New theme colors
    colors = {
      color0 = color "#101010"; # Black
      color1 = color "#efa6a2"; # Red
      color2 = color "#80c990"; # Green
      color3 = color "#467e55"; # Yellow
      color4 = color "#a3b8ef"; # Blue
      color5 = color "#e6a3dc"; # Magenta
      color6 = color "#50cacd"; # Cyan
      color7 = color "#808080"; # White
      color8 = color "#454545"; # Bright Black (Gray)
      color9 = color "#ba74b2"; # Bright Red
      color10 = color "#5accaf"; # Bright Green
      color11 = color "#c8c874"; # Bright Yellow
      color12 = color "#ccaced"; # Bright Blue
      color13 = color "#f2a1c2"; # Bright Magenta
      color14 = color "#69ddb0"; # Bright Cyan
      color15 = color "#c9b099"; # Bright White (Cream)
    };
    types = {
      background = color "#26202c"; # Background
      background-darker = color "#26202c"; # Darker Background (Same as Background)
      foreground = color "#dec692"; # Foreground Text
      highlight = color "#dec692"; # Highlight (Same as Foreground Text)
      border = color "#26202c"; # Border (Same as Background)
      selection = color "#26202c"; # Selection (Same as Background)
      current-line = color "#26202c"; # Current Line (Same as Background)
    };
    syntax = {
      comment = color "#dec692"; # Comment
      keyword = color "#efa6a2"; # Keyword
      function = color "#c8c874"; # Function
      variable = color "#ba74b2"; # Variable
      string = color "#a3b8ef"; # String
      label = color "#ccaced"; # Label
    };
    diagnostic = {
      error = color "#efa6a2"; # Error (Same as Red)
      warning = color "#c8c874"; # Warning (Same as Bright Yellow)
    };
  };
}
