{
    programs.tmux = {
        enable = true;
        clock24 = true;
        extraConfig = ''
            # leader
            unbind C-b
            set-option -g prefix C-a
            bind-key C-a send-prefix

            # window settings
            bind c new-window -c "#{pane_current_path}"
            set-option -g history-limit 5000
        '';
    };
}
