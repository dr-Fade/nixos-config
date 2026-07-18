{ pkgs, ... }: {
  # Rofi config managed via symlinked directory.
  # programs.rofi is NOT used because it generates .config/rofi/config.rasi
  # which conflicts with the recursive symlink below.
  home.packages = [ pkgs.rofi ];

  home.file.".config/rofi".source = ./rofi;
}
