vim.g.notes_directories = { '~/Documents/Workspace/Thinkei/Notes' }
vim.g.notes_tab_indents = 0
map('n', '<space>gn', ':80vs note:home<cr>:MostRecentNote<cr><cr>', { silent = true })
