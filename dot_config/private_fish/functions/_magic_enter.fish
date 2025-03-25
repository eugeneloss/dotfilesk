function _magic_enter
    if test -z (commandline)  # Check if command line is empty
        eza --color=always --icons --long --group-directories-first -h
        commandline -f repaint
    else
        commandline -f execute  # Run the command if not empty
    end
end
