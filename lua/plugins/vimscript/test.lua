return {
  "dakennguyen/vim-test",
  keys = { "t<c-f>", "t<c-n>", "t<c-d>" },
  dependencies = "https://tpope.io/vim/projectionist.git",
  config = function()
    -- vim.cmd [[
    --   function! BufferStrategy(cmd)
    --     execute 'R !' . a:cmd
    --     execute 'set filetype=sh'
    --   endfunction
    -- ]]

    -- vim.g["test#custom_strategies"] = { buffer = vim.fn["BufferStrategy"] }
    vim.g["test#strategy"] = "dispatch_background"
    vim.g["test#neovim#term_position"] = "vert"
    vim.g["test#neovim#start_normal"] = 1

    vim.g["test#ruby#bundle_exec"] = 1
    vim.g["test#ruby#use_binstubs"] = 0

    vim.g["test#javascript#runner"] = "jest"
    vim.g["test#javascript#jest#executable"] = "yarn test"

    vim.g["test#java#gradletest#options"] = "--info"

    vim.g["test#python#pytest#options"] = "-vv"

    map("n", "t<C-n>", ":TestNearest<CR>", { remap = true, silent = true })
    map("n", "t<C-d>", ":TestNearest -strategy=neovim<CR>", { remap = true, silent = true })
    map("n", "t<C-f>", ":TestFile<CR>", { remap = true, silent = true })
    map("n", "t<C-s>", ":TestSuite<CR>", { remap = true, silent = true })
    map("n", "t<C-l>", ":TestLast<CR>", { remap = true, silent = true })
    map("n", "t<C-g>", ":TestVisit<CR>", { remap = true, silent = true })

    if vim.fn.filereadable ".nvimrc" == 1 then
      vim.cmd "source .nvimrc"
    end
  end,
}
