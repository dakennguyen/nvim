local actions = require('telescope.actions')

local custom_actions = {}
function custom_actions.send_and_open_qf(prompt_bufnr)
  actions.send_selected_to_qflist(prompt_bufnr)
  actions.open_qflist()
end

require('telescope').setup{
  defaults = {
    layout_config = {
      prompt_position = 'bottom',
      horizontal = {
        width = { padding = 3 },
        height = { padding = 3 },
        preview_width = 0.5,
      }
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    file_ignore_patterns = { '%.git/.*', 'node_modules/.*' },
    mappings = {
      i = {
        ['<Esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = custom_actions.send_and_open_qf,
        ['<C-s>'] = actions.select_horizontal,
      }
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<cr>"] = "select_horizontal",
          ["<c-d>"] = "delete_buffer",
        },
      }
    },
    find_files = {
      theme = "ivy"
    },
    help_tags = {
      theme = "ivy"
    },
    keymaps = {
      theme = "ivy"
    },
    tags = {
      theme = "ivy"
    },
    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
    tagstack = {
      theme = "dropdown",
      previewer = false,
    },
    git_branches = {
      theme = "dropdown",
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

require('telescope').load_extension('fzf')

vim.cmd[[command! -nargs=? Tgrep lua require 'telescope.builtin'.grep_string({ search = <q-args> })]]

-- Files
map('n', '<space>ff', '<CMD>Telescope find_files hidden=true follow=true<CR>')
map('n', '<space>fd', [[:lua require('telescope.builtin').find_files({search_dirs = {"%:p:h"}, follow = true})<CR>]])
map('n', '<space>fb', '<CMD>Telescope buffers<CR>')
map('n', '<space>fo', '<CMD>Telescope oldfiles<CR>')
map('n', '<space>fs', '<CMD>Telescope tagstack<CR>')
map('n', '<space>fq', '<CMD>Telescope quickfix<CR>')
map('n', '<space>fh', '<CMD>Telescope help_tags<CR>')
map('n', '<space>fm', '<CMD>Telescope keymaps<CR>')
map('n', '<space>fw', '<CMD>Telescope grep_string<CR>')
-- map('v', '<space>fw', [[y:lua require('telescope.builtin').grep_string({search = '<C-R>=escape(@",'/\')<CR>'})<CR>]])
map('v', '<space>fw', [[y:Tgrep <C-R>"]])
map('n', '<space>f]', [[yiw<CMD>Telescope tags<CR><C-R>"<CR>]])

-- Git
map('n', '<leader>gc', '<CMD>Telescope git_branches<CR>')

-- Search
map('n', '//', '<CMD>Telescope current_buffer_fuzzy_find<CR>', { silent = true })
-- map('n', '\\', '<CMD>Telescope live_grep<CR>')
map('n', '\\', ':Tgrep ')
