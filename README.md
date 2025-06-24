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

export PROJECT_PATHS=(~/projects ~/.dotfiles)
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

For Linux
```sh
hour=$(date +%H)
# assumes "daytime" is from 07:00 to 18:59
if [ "$hour" -ge 7 ] && [ "$hour" -lt 19 ]; then
    export THEME_MODE=light
else
    export THEME_MODE=dark
fi
```
