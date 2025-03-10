return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    require "plugins.tpope.dadbod",
  },
  event = "InsertEnter",
  opts = function()
    local cmp = require "cmp"
    local kind_icons = require("icons").symbol_kinds

    local select_next_item = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end

    local select_prev_item = function()
      if cmp.visible() then cmp.select_prev_item() end
    end

    return {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            ["vim-dadbod-completion"] = "[DB]",
          })[entry.source.name]
          return vim_item
        end,
      },
      mapping = {
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Tab>"] = cmp.mapping(select_next_item, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(select_prev_item, { "i", "s" }),
        ["<C-N>"] = cmp.mapping(select_next_item, { "i", "s" }),
        ["<C-P>"] = cmp.mapping(select_prev_item, { "i", "s" }),
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "vsnip" },
      },
    }
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)

    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
        { name = "path" },
        { name = "vsnip" },
      },
    })
  end,
}
