{ pkgs, ... }: {
  # Kitty is installed at the nixos level (environment.systemPackages).
  # All kitty settings (colors, fonts, opacity) are in kitty.conf via source.
  home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;
  home.file.".config/kitty/diff.conf".source = ./kitty/diff.conf;
}
