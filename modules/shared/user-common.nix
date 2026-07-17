{ pkgs, ... }: {
  home.username = "eugene";
  home.homeDirectory = "/home/eugene";

  programs.git = {
    enable = true;
    userName = "dr_Fade";
    userEmail = "eugenefade@gmail.com";
  };

  programs.bash.enable = true;

  home.stateVersion = "24.11";
}
