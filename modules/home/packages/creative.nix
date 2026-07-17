{ pkgs, ... }: {
  home.packages = with pkgs; [
    ardour
    musescore
    krita
    inkscape
    swappy
  ];
}
