return {
  "jpalardy/vim-slime",
  init = function() vim.g.slime_target = "neovim" end,
  keys = {
    "<c-c><c-c>",
    "<c-c>v",
    { "<c-c><c-l>", "<cmd>SlimeSendCurrentLine<cr>" },
    { "<c-c>l", "<cmd>SlimeSendCurrentLine<cr>" },
  },
  cmd = { "SlimeConfig", "SlimeSend" },
}
