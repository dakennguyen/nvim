" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like fugitive
runtime! ftplugin/fugitive.vim

setlocal foldmethod=syntax
