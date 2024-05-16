{
  config,
  pkgs,
  ...
}: let
  in{
imports = [
./telescope.nix
./neo-tree.nix
];
    programs.nixvim = {
    enable = true;
  };
}



