{ pkgs, ... }: {
  home.packages = with pkgs; [
    libreoffice
    julia
    remmina
    freerdp
  ];
}
