return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter" },
    dependencies = { "rcarriga/cmp-dap" },
    opts = {
      keymap = {
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-l>"] = {
          "show",
          function(cmp)
            local entry, index = cmp.get_selected_item(), nil
            if not entry then
              entry, index = cmp.get_items()[1], 1
            end
            if not entry or entry.source_name ~= "Snippets" then return end

            cmp.accept {
              index = index,
              callback = function()
                vim.cmd "normal! hpl"
                vim.cmd "stopinsert"
              end,
            }
            return true
          end,
        },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev" },
        ["<C-n>"] = { "select_next", "show" },
        ["<C-p>"] = { "select_prev" },
        ["<C-k>"] = { "fallback" },
      },
      cmdline = { enabled = false },
      sources = {
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer", "path" },
          ["dap-repl"] = { "dap", "snippets", "buffer" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
          snippets = { score_offset = 100 },
          dap = { name = "dap", module = "blink.compat.source" },
        },
      },
      appearance = {
        kind_icons = require("icons").symbol_kinds,
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        menu = {
          draw = {
            columns = {
              { "label" },
              { "kind_icon", gap = 1, "kind" },
              { "label_description" },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
        },
      },
    },
  },
}
