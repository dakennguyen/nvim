local actions = require('telescope.actions')

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
        ['<C-q>'] = actions.smart_send_to_qflist,
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
      -- theme = "ivy"
    },
    tags = {
      theme = "ivy"
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

vim.cmd[[command! -nargs=? Tgrep lua require 'telescope.builtin'.grep_string({ search = <q-args> })]]

-- Files
map('n', '<c-p>', '<CMD>Telescope find_files hidden=true follow=true<CR>')
map('n', '<leader>ff', [[:lua require('telescope.builtin').find_files({search_dirs = {"%:p:h"}, follow = true})<CR>]])
map('n', '<leader>b', '<CMD>Telescope buffers<CR>')
map('n', '<leader>fq', '<CMD>Telescope quickfix<CR>')
map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>')

-- Search
map('n', '//', '<CMD>Telescope current_buffer_fuzzy_find<CR>', { silent = true })
map('n', '<leader><leader>', ':Tgrep ')
map('n', '\\', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>fw', '<CMD>Telescope grep_string<CR>')
map('v', '<leader>fw', [[y:lua require('telescope.builtin').grep_string({search = '<C-R>=escape(@",'/\')<CR>'})<CR>]])
map('n', '<C-]>', [[yiw<CMD>Telescope tags<CR><C-R>"<CR>]])
