return {
  {
    "tpope/vim-dadbod",
    cmd = "DB",
    keys = {
      { mode = "", "<space>dd", ":DB" }, -- let g:db = ...
      { mode = "", "<space>dr", ":DB g:redis" },
      { mode = "", "<space>dt", ":DB g:dbtest" },
    },
    config = function()
      vim.g["redis"] = "redis:localhost:6379"
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
    dependencies = "tpope/vim-dadbod",
  },
}
