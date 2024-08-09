return {
  "leoluz/nvim-dap-go",
  dependencies = "mfussenegger/nvim-dap",
  lazy = false,
  config = function()
    require("dap-go").setup({
      delve = {
        path = "/Users/dakennguyen/go/bin/dlv",
      }
    })
  end,
}
