return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    ignored_next_char = "[%w%:%.]",
  },
  config = function(_, opts)
    local npairs = require "nvim-autopairs"

    npairs.setup(opts)

    npairs.add_rules(require "nvim-autopairs.rules.endwise-ruby")
    npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
  end,
}
