{ pkgs, ... }: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fi" = "media_files";
      };
      extensions.media-files = {
        enable = true;
        settings = {
          backend = "viu";
          filetypes = [ "png" "jpg" "jpeg" "webp" "gif" ];
        };
      };
    };

    # This ensures viu is installed system-wide
    extraPackages = [ pkgs.viu ];

    extraConfigLua = ''
      require('telescope').setup{
        extensions = {
          media_files = {
            backend = "viu",
            cmd = {"viu", "-w", "60"}
          }
        }
      }
      require('telescope').load_extension('media_files')
    '';
  };
}
