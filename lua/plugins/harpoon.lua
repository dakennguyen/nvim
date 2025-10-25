vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
}

vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
vim.keymap.set("n", "<space>a", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)
vim.keymap.set("n", "<space>1", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<space>2", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<space>3", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<space>4", function() require("harpoon"):list():select(4) end)

local harpoon = require "harpoon"
local extensions = require "harpoon.extensions"

harpoon:setup()
harpoon:extend(extensions.builtins.navigate_with_number())
harpoon:extend(extensions.builtins.highlight_current_file())
harpoon:extend {
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function() harpoon.ui:select_menu_item { vsplit = true } end, { buffer = cx.bufnr })
    vim.keymap.set("n", "<C-s>", function() harpoon.ui:select_menu_item { split = true } end, { buffer = cx.bufnr })
    vim.keymap.set("n", "<C-t>", function() harpoon.ui:select_menu_item { tabedit = true } end, { buffer = cx.bufnr })
  end,
}
