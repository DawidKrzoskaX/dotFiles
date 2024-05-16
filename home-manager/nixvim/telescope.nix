{
  plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<C-p>" = "git_files";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = /* lua */ ''
        function() 
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") });
        end
      '';
      lua = true;
    }
  ];
}
