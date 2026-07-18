{ pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    bash-language-server
  ];
}
