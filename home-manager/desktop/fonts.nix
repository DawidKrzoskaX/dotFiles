{ pkgs, ... }: {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "FiraCode Nerd Font";
      package = pkgs.nerdfonts;
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };
}
