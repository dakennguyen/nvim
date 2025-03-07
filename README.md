# Install
## Using stow
Install [stow](https://www.gnu.org/software/stow/), then run:

    stow . -t ~

## Manually

    ln -s ~/.dotfiles/nvim/.config/nvim ~/.config/nvim
    ln -s ~/.dotfiles/nvim/.vsnip ~/.vsnip

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
