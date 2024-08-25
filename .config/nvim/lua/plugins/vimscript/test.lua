return {
  "dakennguyen/vim-test",
  keys = {
    { "t<C-n>", ":TestNearest<CR>", remap = true, silent = true },
    { "t<C-d>", ":TestNearest -strategy=neovim_sticky<CR>", remap = true, silent = true },
    { "t<C-f>", ":TestFile<CR>", remap = true, silent = true },
    { "t<C-s>", ":TestSuite<CR>", remap = true, silent = true },
    { "t<C-l>", ":TestLast<CR>", remap = true, silent = true },
    { "t<C-g>", ":TestVisit<CR>", remap = true, silent = true },
  },
  dependencies = "tpope/vim-projectionist",
  config = function()
    -- vim.cmd [[
    --   function! BufferStrategy(cmd)
    --     execute 'R !' . a:cmd
    --     execute 'set filetype=sh'
    --   endfunction
    -- ]]

    -- vim.g["test#custom_strategies"] = { buffer = vim.fn["BufferStrategy"] }
    vim.g["test#strategy"] = "dispatch"
    vim.g["test#preserve_screen"] = 0
    vim.g["test#neovim#term_position"] = "topleft"
    vim.g["test#neovim#start_normal"] = 1
    vim.g["test#neovim_sticky#reopen_window"] = 1

    vim.g["test#ruby#bundle_exec"] = 1
    vim.g["test#ruby#use_binstubs"] = 0

    vim.g["test#javascript#runner"] = "jest"
    vim.g["test#javascript#jest#executable"] = "yarn test"

    vim.g["test#java#gradletest#options"] = "--info"

    vim.g["test#python#pytest#options"] = "-vv"

    if vim.fn.filereadable ".nvimrc" == 1 then
      vim.cmd "source .nvimrc"
    end
  end,
}
