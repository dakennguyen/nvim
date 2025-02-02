return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = function()
    local harpoon = require "harpoon"

    return {
      {
        "<leader>a",
        function()
          harpoon:list():add()
        end,
      },
      {
        "<space>a",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
      },
      {
        "<space>1",
        function()
          harpoon:list():select(1)
        end,
      },
      {
        "<space>2",
        function()
          harpoon:list():select(2)
        end,
      },
      {
        "<space>3",
        function()
          harpoon:list():select(3)
        end,
      },
      {
        "<space>4",
        function()
          harpoon:list():select(4)
        end,
      },
    }
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    local extensions = require "harpoon.extensions"

    harpoon:setup()
    harpoon:extend(extensions.builtins.navigate_with_number())
    harpoon:extend(extensions.builtins.highlight_current_file())
    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-s>", function()
          harpoon.ui:select_menu_item { split = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item { tabedit = true }
        end, { buffer = cx.bufnr })
      end,
    }
  end,
}
