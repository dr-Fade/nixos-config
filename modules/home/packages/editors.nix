{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    lua-language-server
    bash-language-server
  ];
}
