# Install
## Using stow
Install [stow](https://www.gnu.org/software/stow/), then run:

    stow . -t ~

## Manually

    ln -s ~/.dotfiles/nvim/.config/nvim ~/.config/nvim
    ln -s ~/.dotfiles/nvim/.vsnip ~/.vsnip

# Setup
Export env variables

    export MYBROWSER=firefox

    export PROJECT_PATHS=(~/.dotfiles ~/projects)
    export PROJECT_PATHS_STR="${(j.:.)PROJECT_PATHS}"

(Optional) To custom mode, create `~/.config/nvim/lua/themes/mode.lua`:

```lua
vim.opt.background = 'light'

return {
  light_theme = "gruvbox",
  dark_theme = "gruvbox",
  lualine_theme = "evil",
}
```
