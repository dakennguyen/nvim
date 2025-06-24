return {
  "jpalardy/vim-slime",
  init = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = {
      socket_name = vim.fn.get(vim.split(vim.env.TMUX or "", ","), 0),
      target_pane = ":.2",
    }
  end,
  keys = {
    { mode = { "n", "v" }, "<c-c><c-c>" },
    "<c-c>v",
    { "<c-c><c-l>", "<cmd>SlimeSendCurrentLine<cr>" },
    { "<c-c>l", "<cmd>SlimeSendCurrentLine<cr>" },
  },
  cmd = { "SlimeConfig", "SlimeSend", "SlimeSend0", "SlimeSend1" },
}
