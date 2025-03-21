return {
  "saghen/blink.cmp",
  version = "*",
  build = "cargo build --release",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    keymap = {
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-l>"] = {
        function(cmp)
          local entry = cmp.get_selected_item() or cmp.get_items()[1]
          if not entry or entry.source_name ~= "Snippets" then return end

          cmp.accept {
            index = 1,
            callback = function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>p", true, false, true), "n", false)
            end,
          }
          return true
        end,
        "fallback",
      },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev" },
      ["<C-n>"] = { "select_next", "show" },
      ["<C-p>"] = { "select_prev" },
    },
    sources = {
      per_filetype = {
        sql = { "snippets", "dadbod", "buffer", "path" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
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
      documentation = { auto_show = true },
    },
  },
}
