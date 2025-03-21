# Install

    ln -s $PWD ~/.config/nvim

# Setup
Export env variables

    # For macOS
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        export THEME_MODE=dark
    else
        export THEME_MODE=light
    fi
    export THEME_LIGHT=default
    export THEME_DARK=default
    export THEME_LUALINE=bubble
    export MYBROWSER=firefox

    export PROJECT_PATHS=(~/.dotfiles ~/projects)
    export PROJECT_PATHS_STR="${(j.:.)PROJECT_PATHS}"
