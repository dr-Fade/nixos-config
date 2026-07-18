{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    telegram-desktop
  ];
}
