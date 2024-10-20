return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<space>ff", ":FzfLua files<CR>", silent = true },
    { "<space>fd", ":FzfLua files cwd=%:p:h<CR>", silent = true },
    { "<space>fb", ":FzfLua buffers<CR>", silent = true },
    { "<space>fo", ":FzfLua oldfiles<CR>", silent = true },
    { "<space>fc", ":FzfLua command_history<CR>", silent = true },
    { "<space>fh", ":FzfLua help_tags<CR>", silent = true },
    { "<space>fm", ":FzfLua keymaps<CR>", silent = true },
    { "<space>fw", ":FzfLua grep<cr><C-R><C-W><CR>", silent = true },
    { mode = "v", "<space>fw", [[y:FzfLua grep<cr><C-R>=escape(@",'/\')<CR><CR>]], silent = true },

    { "<space>fs", ":FzfLua files cwd=local_scripts<CR>", silent = true },
    {
      "<space>fn",
      function()
        require("fzf-lua").files { cwd = "~/Library/Mobile Documents/com~apple~CloudDocs/Notes" }
      end,
      silent = true,
    },

    { "//", ":FzfLua grep_curbuf<CR>" },
    { "\\", ":FzfLua grep<CR>" },
  },
  cmd = "FzfLua",
  config = function()
    local actions = require "fzf-lua.actions"
    require("fzf-lua").setup {
      hls = {
        border = "Normal",
        preview_border = "Normal",
        preview_normal = "Normal",
        preview_title = "Normal",
      },
      winopts = {
        row = 1,
        width = 1,
        height = 0.6,
        backdrop = 100,
        preview = {
          horizontal = "right:50%",
        },
        on_create = function()
          vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
          vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
        end,
      },
      keymap = {
        builtin = {
          ["<C-H>"] = "toggle-preview",
          ["<C-D>"] = "preview-page-down",
          ["<C-U>"] = "preview-page-up",
        },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      fzf_colors = {
        fg = { "fg", "Normal" },
        bg = { "bg", "Normal" },
        hl = { "fg", "Comment" },
        ["fg+"] = { "fg", "Normal" },
        ["bg+"] = { "bg", "CursorLine" },
        ["hl+"] = { "fg", "Statement" },
        info = { "fg", "PreProc" },
        border = { "fg", "Ignore" },
        prompt = { "fg", "Conditional" },
        pointer = { "fg", "Exception" },
        marker = { "fg", "Keyword" },
        spinner = { "fg", "Label" },
        header = { "fg", "Comment" },
        gutter = { "bg", "Normal" },
      },
      actions = {
        files = {
          true,
          ["ctrl-q"] = actions.file_sel_to_qf,
        },
      },
    }

    vim.cmd "FzfLua register_ui_select"
  end,
}
