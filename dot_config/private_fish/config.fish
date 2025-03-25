if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end
# Check if the fish prompt is active and TMUX is not running
if test -n "$fish_prompt" && test -z "$TMUX"
  tmux -u new-session -A -s main
end
abbr v "nvim"
abbr gs "git status"
abbr c "clear"
