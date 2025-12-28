# Install

Clone this repository straight into your Neovim config directory, or keep it elsewhere and symlink it in.

```sh
# Option A: clone directly
git clone <repository-url> ~/.config/nvim

# Option B: symlink a checked-out copy
ln -s $PWD ~/.config/nvim
```

# Setup (optional)
### Enable LSP servers

Copy the sample config file:
```sh
cp ./lua/config/lsp-servers.lua.dist ./lua/config/lsp-servers.lua
```

Then edit `./lua/config/lsp-servers.lua` and uncomment or add the servers you want to enable, using the filenames from `lsp/`, for example:

```lua
vim.lsp.enable {
  "efm",
  "gopls",
  "jsonls",
  "lua_ls",
  -- ...
}
```

### Configuration

Set these to match your preferred tools, themes, and project directories.

```sh
# Theme names must match files in `lua/themes/`
export THEME_LIGHT=gruvbox
export THEME_DARK=gruvbox
export THEME_MODE=dark # or light, for auto-detect see below

# Default browser
export MYBROWSER=firefox

# Default code agent CLI
export MYCODEAGENT=cursor-agent

# List directories that contain your project folders
export PROJECT_PATHS=(~/projects ~/freelance)
export PROJECT_PATHS_STR="${(j.:.)PROJECT_PATHS}"
```

### Auto-detect light/dark mode
Use one of the scripts below to automatically set `THEME_MODE` based on system settings (macOS) or time of day (Linux).

Hint: put it somewhere that runs before Neovim starts. For example, in `~/.zshenv` and make an alias `alias v="source ~/.zshenv && nvim"`.

For macOS:
```sh
if defaults read -g AppleInterfaceStyle &>/dev/null; then
    export THEME_MODE=dark
else
    export THEME_MODE=light
fi
```

For Linux:
```sh
hour=$(date +%H)
# assumes "daytime" is from 07:00 to 18:59
if [ "$hour" -ge 7 ] && [ "$hour" -lt 19 ]; then
    export THEME_MODE=light
else
    export THEME_MODE=dark
fi
```
