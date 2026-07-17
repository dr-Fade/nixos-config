{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
    tmux
    htop
    less
    unzip
    ripgrep
    bash-completion
  ];
}
