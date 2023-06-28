return {
  "andymass/vim-matchup",
  init = lazy_load "vim-matchup",
  config = function()
    vim.g.matchup_matchparen_offscreen = {}

    highlight("MatchParen", { style = "italic" })
  end,
}
