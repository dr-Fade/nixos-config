{ pkgs, ... }: {
  # GTK theme (Nordic-Polar — provided by the `nordic` nixpkgs package)
  gtk = {
    enable = true;
    theme = {
      name = "Nordic-Polar";
      package = pkgs.nordic;
    };
  };
}
