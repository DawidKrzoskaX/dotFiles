{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        nixfmt.enable = true;
        markdownlint.enable = true;
      };
    };
  };
}
