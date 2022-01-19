on RunVash(Cmd, Theme, Cols, Rows)
    tell application "Terminal"
        if it is not running then
            set newTerm to do script Cmd in window 1
        else
            set newTerm to do script Cmd
        end if
        activate
        set newTerm's current settings to settings set Theme
        set number of columns of front window to Cols
        set number of rows of front window to Rows
    end tell
end RunVash
