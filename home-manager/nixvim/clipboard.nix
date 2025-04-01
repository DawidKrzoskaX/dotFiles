{ pkgs, ... }: {
  programs.nixvim = {
    # 1. Ensure Neovim has clipboard support
    extraPackages = with pkgs;
      [ wl-clipboard ]; # Wayland (wl-copy) or X11 (xclip)

    # 2. Configure clipboard behavior
    opts = {
      clipboard =
        "unnamedplus"; # Sync with system clipboard (registers `"+y` and `"+p`)
    };

    # 3. Keybindings for Ctrl+Shift+C/V
    keymaps = [
      {
        mode = [ "n" "v" ];
        key = "<C-S-c>";
        action = ''"+y'';
        options.desc = "Copy to system clipboard";
      }
      {
        mode = [ "n" "v" ];
        key = "<C-S-v>";
        action = ''"+p'';
        options.desc = "Paste from system clipboard";
      }
    ];
  };
}
