# Greeting
set -g fish_greeting

# Prompt
function fish_prompt
    set last_status $status

    # Environment
    set_color green && echo -n $USER
    set_color normal && echo -n "@$hostname"

    # Directory
    set_color blue && echo -n " "$(dirs)

    # Git
    set git_branch $(fish_git_prompt)
    if test $git_branch
        set_color yellow && echo -n $git_branch

        set git_status $(git status --porcelain | wc -l)
        if test $git_status -gt 0
            echo -n "±$git_status"
        end
    end

    # Status
    if test $last_status -ne 0
        set_color red && echo -n " [$last_status]"
    end

    # Command
    set_color normal && echo -n " \$ "
end

# Abbreviations
abbr -a ll -- 'ls -la'
abbr -a v -- 'vim'
