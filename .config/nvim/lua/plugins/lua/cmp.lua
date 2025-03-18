return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  opts = function()
    local cmp = require "cmp"
    local kind_icons = require("icons").symbol_kinds

    local select_next_item = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.snippet.active { direction = 1 } then
        vim.cmd "lua vim.snippet.jump(1)"
      else
        fallback()
      end
    end

    local select_prev_item = function()
      if cmp.visible() then cmp.select_prev_item() end
    end

    local expand_snippet = function(fallback)
      local entry = cmp.get_selected_entry() or cmp.get_entries()[1]
      if not entry or not entry.completion_item or entry.completion_item.insertTextFormat ~= 2 then
        fallback()
        return
      end

      cmp.confirm { select = true }
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>p", true, false, true), "n", false)
    end

    return {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args) vim.snippet.expand(args.body) end,
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
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<C-l>"] = cmp.mapping(expand_snippet, { "i", "c" }),
        ["<Tab>"] = cmp.mapping(select_next_item, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(select_prev_item, { "i", "s" }),
        ["<C-N>"] = cmp.mapping(select_next_item, { "i", "s" }),
        ["<C-P>"] = cmp.mapping(select_prev_item, { "i", "s" }),
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "snp" },
      },
    }
  end,
  config = function(_, opts)
    local cmp = require "cmp"

    require("snippets").register_source(cmp, "snp")

    cmp.setup(opts)
    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
        { name = "path" },
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = "path" },
        { name = "cmdline" },
      },
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
