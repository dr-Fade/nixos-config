{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
    htop
    less
    unzip
    ripgrep
    bash-completion
  ];
}
