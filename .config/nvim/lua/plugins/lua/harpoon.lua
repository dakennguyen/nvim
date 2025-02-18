return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { "<leader>a", function() require("harpoon"):list():add() end },
    { "<space>a", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
    { "<space>1", function() require("harpoon"):list():select(1) end },
    { "<space>2", function() require("harpoon"):list():select(2) end },
    { "<space>3", function() require("harpoon"):list():select(3) end },
    { "<space>4", function() require("harpoon"):list():select(4) end },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    local extensions = require "harpoon.extensions"

    harpoon:setup()
    harpoon:extend(extensions.builtins.navigate_with_number())
    harpoon:extend(extensions.builtins.highlight_current_file())
    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set(
          "n",
          "<C-v>",
          function() harpoon.ui:select_menu_item { vsplit = true } end,
          { buffer = cx.bufnr }
        )

        vim.keymap.set("n", "<C-s>", function() harpoon.ui:select_menu_item { split = true } end, { buffer = cx.bufnr })

        vim.keymap.set(
          "n",
          "<C-t>",
          function() harpoon.ui:select_menu_item { tabedit = true } end,
          { buffer = cx.bufnr }
        )
      end,
    }
  end,
}
