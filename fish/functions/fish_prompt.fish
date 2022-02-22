function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color yellow -o
    printf '%s' $USER
    set_color normal
    printf ' at '

    set_color brmagenta -o
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end

    set -g __fish_git_prompt_showupstream auto
    printf (fish_git_prompt)

    set_color brcyan -o
    printf ' >>> '
    set_color normal
end
