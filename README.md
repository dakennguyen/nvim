# Install

```sh
ln -s $PWD ~/.config/nvim
```

# Setup
### Enable LSP servers

Use file names in `lsp/`
```sh
cp ./lua/config/lsp-servers.lua.dist ./lua/config/lsp-servers.lua
```

### Export env variables

```sh
# Use file names from `lua/themes/`
export THEME_LIGHT=default
export THEME_DARK=default

export PROJECT_PATHS=(~/.dotfiles ~/projects)
export PROJECT_PATHS_STR="${(j.:.)PROJECT_PATHS}"
```

For MacOS
```sh
if defaults read -g AppleInterfaceStyle &>/dev/null; then
    export THEME_MODE=dark
else
    export THEME_MODE=light
fi

# Find app name with `mdfind "kMDItemKind == 'Application'"`
export MYBROWSER=firefox
```
