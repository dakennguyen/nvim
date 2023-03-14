return {
  require 'plugins.tpope.dadbod',
  require 'plugins.tpope.fugitive',
  require 'plugins.tpope.projectionist',
  { 'https://tpope.io/vim/surround.git', init = lazy_load 'surround' },
  { 'https://tpope.io/vim/rhubarb.git', event = 'VeryLazy' },
  { 'https://tpope.io/vim/commentary.git', event = 'VeryLazy' },
  { 'https://tpope.io/vim/vinegar.git', event = 'VeryLazy' },
  { 'https://tpope.io/vim/bundler.git', ft = 'ruby' },
  { 'https://tpope.io/vim/repeat.git', init = lazy_load 'repeat', branch = 'no-feedkeys' },
  { 'dakennguyen/vim-unimpaired', init = lazy_load 'vim-unimpaired' },
}
