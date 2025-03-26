if status is-interactive
    # Atuin shell history
    atuin init fish | source

    # Enable Vi mode and cursor settings
    set fish_cursor_default     block      # Default cursor (normal mode)
    set fish_cursor_insert      line       # Insert mode
    set fish_cursor_replace_one underscore # Replace mode
    set fish_cursor_visual      block      # Visual mode
    fish_vi_key_bindings

    # Set editor
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    # TMUX auto-start (only in interactive sessions)
    if test -z "$TMUX" && test -z "$TMUX"
        tmux -u new-session -A -s main
    end


    # Key bindings
    bind \r '_magic_enter'

    # Abbreviations
    abbr v "nvim"
    abbr gs "git status"
    abbr gc "git commit -m"
    abbr gp "git push origin master"
    abbr c "clear"
end
