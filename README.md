# Install
## Using stow
Install [stow](https://www.gnu.org/software/stow/), then run:

    stow . -t ~

## Manually

    ln -s .config/nvim ~/.config/nvim
    ln -s .vsnip ~/.vsnip

# Notes
Ignore mode file:

    git update-index --assume-unchanged .config/nvim/lua/themes/mode.lua
