{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    # Rofi config is often a set of files in themes/
  };

  home.file.".config/rofi".source = ./rofi;
}
