{ pkgs, ... }: {
  home.packages = with pkgs; [
    thunar
    xarchiver
    ristretto
  ];
}
