{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
    tmux
    htop
    nvtop
    less
    unzip
    ripgrep
    bash-completion
  ];
}
