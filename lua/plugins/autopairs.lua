return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    ignored_next_char = "[%w%:%.]",
    map_cr = false,
  },
  config = function(_, opts)
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local endwise = require("nvim-autopairs.ts-rule").endwise

    npairs.setup(opts)

    npairs.add_rules(require "nvim-autopairs.rules.endwise-ruby")

    -- Note: use endwise base on treesitter is not always correct, e.g. when testing with a new file,
    -- so treesitter group should be nil
    npairs.add_rules {
      endwise("then$", "end", "lua", nil),
      endwise("function.*%(.*%)$", "end", "lua", nil),
    }

    -- Add spaces between pairs
    npairs.add_rules {
      Rule(" ", " "):with_pair(function(o)
        local pair = o.line:sub(o.col - 1, o.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
      Rule("( ", " )")
        :with_pair(function() return false end)
        :with_move(function(o) return o.prev_char:match ".%)" ~= nil end)
        :use_key ")",
      Rule("{ ", " }")
        :with_pair(function() return false end)
        :with_move(function(o) return o.prev_char:match ".%}" ~= nil end)
        :use_key "}",
      Rule("[ ", " ]")
        :with_pair(function() return false end)
        :with_move(function(o) return o.prev_char:match ".%]" ~= nil end)
        :use_key "]",
    }
  end,
}
