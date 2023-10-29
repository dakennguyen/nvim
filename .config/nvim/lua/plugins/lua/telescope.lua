return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  event = "VeryLazy",
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    local custom_actions = {}
    function custom_actions.send_and_open_qf(prompt_bufnr)
      actions.send_selected_to_qflist(prompt_bufnr)
      actions.open_qflist(prompt_bufnr)
    end

    telescope.setup {
      defaults = {
        layout_config = {
          prompt_position = "bottom",
          horizontal = {
            width = { padding = 3 },
            height = 0.8,
            preview_width = 0.5,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        file_ignore_patterns = { "%.git/.*", "node_modules/.*" },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<down>"] = actions.move_selection_next,
            ["<up>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = custom_actions.send_and_open_qf,
            ["<C-s>"] = actions.select_horizontal,
          },
        },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer",
            },
          },
        },
        tagstack = {
          theme = "dropdown",
          previewer = false,
        },
        current_buffer_fuzzy_find = {
          theme = "ivy",
          previewer = false,
        },
        command_history = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }

    telescope.load_extension "fzf"

    vim.cmd [[command! -nargs=? Tgrep lua require 'telescope.builtin'.grep_string({ search = <q-args> })]]

    -- Files
    map("n", "<space>ff", "<CMD>Telescope find_files hidden=true follow=true<CR>")
    map(
      "n",
      "<space>fd",
      [[:lua require('telescope.builtin').find_files({search_dirs = {"%:p:h"}, follow = true})<CR>]]
    )
    map("n", "<space>fb", "<CMD>Telescope buffers<CR>")
    map("n", "<space>fo", "<CMD>Telescope oldfiles<CR>")
    map("n", "<space>ft", "<CMD>Telescope tagstack<CR>")
    map("n", "<space>fq", "<CMD>Telescope quickfix<CR>")
    map("n", "<space>fh", "<CMD>Telescope help_tags<CR>")
    map("n", "<space>fm", "<CMD>Telescope keymaps<CR>")
    map("n", "<space>fw", "<CMD>Telescope grep_string<CR>")
    map("v", "<space>fw", [[y:Tgrep <C-R>"<cr>]])
    map("n", "<space>fc", "<CMD>Telescope command_history<CR>")
    map("n", "<space>f]", [[yiw<CMD>Telescope tags<CR><C-R>"<CR>]])

    map("n", "<space>fs", "<CMD>Telescope find_files search_dirs=local_scripts<CR>")

    -- Search
    map("n", "//", "<CMD>Telescope current_buffer_fuzzy_find<CR>", { silent = true })
    map("n", "\\", ":Tgrep ")
  end,
}
