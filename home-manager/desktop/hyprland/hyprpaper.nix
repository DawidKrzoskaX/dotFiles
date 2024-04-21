{
  config,
  pkgs,
  ...
}: let

  in{
  home.packages = with pkgs; [
    hyprpaper
    ];

}

