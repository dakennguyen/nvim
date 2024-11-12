return {
  "mfussenegger/nvim-dap",
  dependencies = "leoluz/nvim-dap-go",
  keys = {
    {
      "<F9>",
      function() require("dap").toggle_breakpoint() end,
    },
    {
      "<leader>dl",
      function()
        require("dap").list_breakpoints()
        vim.cmd "cw"
      end,
    },
    {
      "<leader>dL",
      function() require("dap").clear_breakpoints() end,
    },
    {
      "<leader>d;",
      function() require("dap").run_last() end,
    },
    {
      "<leader>d.",
      function() require("dap").run_to_cursor() end,
    },
    {
      "<S-F5>",
      function() require("dap").terminate() end,
    },
    {
      "<leader>dr",
      function() require("dap").restart() end,
    },
    {
      "<leader>de",
      function() require("dapui").eval(nil, { enter = true }) end,
    },
    {
      "<leader>dE",
      function() require("dap").repl.open() end,
    },
    {
      "<F5>",
      function() require("dap").continue() end,
    },
    {
      "<F10>",
      function() require("dap").step_over() end,
    },
    {
      "<F11>",
      function() require("dap").step_into() end,
    },
    {
      "<F12>",
      function() require("dap").step_out() end,
    },
  },
  config = function()
    require("dap-go").setup()

    local dap = require "dap"
    dap.adapters.lldb = {
      type = "executable",
      command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
      name = "lldb",
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
  end,
}
