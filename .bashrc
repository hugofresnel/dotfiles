# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
function dynamic_prompt {
    local LAST_STATUS=$?

    # Environment
    PS1="\[\e[32m\]$USER"
    PS1+="\[\e[0m\]@$HOSTNAME"

    # Directory
    PS1+="\[\e[34m\] $(dirs)"

    # Git
    local GIT_BRANCH=$(git branch --show-current 2> /dev/null)
    if [[ ! -z "$GIT_BRANCH" ]]; then
        PS1+=" \[\e[33m\](${GIT_BRANCH})"

        local GIT_STATUS=$(git status --porcelain | wc -l)
        if [[ "$GIT_STATUS" -gt 0 ]]; then
            PS1+="±${GIT_STATUS}"
        fi
    fi

    # Status
    if [[ "$LAST_STATUS" -ne 0 ]]; then
        PS1+="\[\e[31m\] [$LAST_STATUS]"
    fi

    # Command
    PS1+="\[\e[0m\] $ "
}
PROMPT_COMMAND=dynamic_prompt

# Aliases
if [[ -f ~/.bash_aliases && -r ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# Completion
if [[ -f /usr/share/bash-completion/bash_completion && -r /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi
