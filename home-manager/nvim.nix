{
  config,
  pkgs,
  ...
}: let

  in{

	programs.neovim = {
		enable = true;
		vimAlias = true;
		viAlias = true;
		};

}
