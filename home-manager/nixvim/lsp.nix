{
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd = {
          enable = true;
          extraOptions = {
            cmd = [
              "clangd"
              "--background-index"
              "--clang-tidy"
              "--header-insertion=never"
              "--completion-style=detailed"
              "--query-driver=/usr/bin/clang++,/usr/bin/g++"
              "--all-scopes-completion"
              "--cross-file-rename"
              "--malloc-trim"
            ];
            init_options = { fallbackFlags = [ "-std=c++20" ]; };
          };
        };
        nixd.enable = true;
        rust_analyzer.enable = true;
        rust_analyzer.installRustc = false;
        rust_analyzer.installCargo = false;

      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };
}
