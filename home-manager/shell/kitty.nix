{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    # Basic settings matching your Alacritty config
    settings = {
      window_padding_width = "2 10";
      font_family = "FiraCode Nerd Font";
      font_size = 12.0;

      # Kitty-specific enhancements
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      allow_remote_control = "yes";
      shell_integration = "enabled";
    };

    # Theme (optional)
    themeFile = "Catppuccin-Mocha";

    # Keybindings
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+t" = "new_tab";
    };
  };

  # Set TERMINAL variable without using environment.*
  home.sessionVariables = { TERMINAL = "kitty"; };

  # Ensure terminfo is available (alternative method)
  xdg.configFile."kitty/terminfo".source =
    "${pkgs.kitty.terminfo}/share/terminfo";
}
