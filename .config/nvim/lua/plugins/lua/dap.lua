return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    { "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
  },
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
      "<leader>du",
      function() require("dapui").toggle() end,
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
    require("dapui").setup()
    require("dap-go").setup()

    local dap = require("dap")
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = os.getenv "HOME" .. "/opensources/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      -- {
      --   name = 'Attach to gdbserver :1234',
      --   type = 'cppdbg',
      --   request = 'launch',
      --   MIMode = 'gdb',
      --   miDebuggerServerAddress = 'localhost:1234',
      --   miDebuggerPath = '/usr/bin/gdb',
      --   cwd = '${workspaceFolder}',
      --   program = function()
      --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --   end,
      -- },
    }

  end,
}
