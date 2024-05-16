{
  plugins.neo-tree = {
    enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action = /* lua */ ''
        function() vim.cmd("Neotree position=float toggle reveal") end
      '';
      lua = true;
      options.desc = "Open NeoTree in float mode";
    }
  ];
}
