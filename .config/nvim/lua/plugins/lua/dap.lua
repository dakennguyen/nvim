return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
    },
    keys = {
      { "<F9>", function() require("dap").toggle_breakpoint() end },
      {
        "<F21>",
        function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
        { desc = "Set Conditional Breakpoint" },
      }, -- <S-F9>
      { "<F5>", function() require("dap").continue() end },
      { "<F10>", function() require("dap").step_over() end },
      { "<F11>", function() require("dap").step_into() end },
      { "<F12>", function() require("dap").step_out() end },
      { "<leader>dl", function() require("dap").run_last() end },
      { "<leader>d.", function() require("dap").run_to_cursor() end },
      { "<leader>dr", function() require("dap").repl.open() end },
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
          program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      {
        "<F17>",
        function()
          require("dap").terminate()
          require("dapui").close()
        end,
      }, -- <S-F5>
      { mode = { "n", "v" }, "<m-k>", function() require("dapui").eval() end },
      { "<leader>du", function() require("dapui").toggle() end },
      { "<leader>de", function() require("dapui").elements.watches.add() end },
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"

      dapui.setup()
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },
}
