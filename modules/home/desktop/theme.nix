{ pkgs, ... }: {
  # GTK theme (Nordic-Polar from Arch setup)
  gtk = {
    enable = true;
    theme = {
      name = "Nordic-Polar";
      package = pkgs.nordic-polar-theme;
    };
  };
}
