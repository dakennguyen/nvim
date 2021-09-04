require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-compe"
      }
    },
    ["core.integrations.treesitter"] = {
      config = {
        highlights = {
          tag = {
            content = "guifg=#616E88",
            comment = "guifg=#616E88",
          },
        }
      }
    }
  },
}

map('n', '<space>gn', ':vert botright 80 new ~/Library/Mobile Documents/com~apple~CloudDocs/norg/_General.norg<cr>', { silent = true })
