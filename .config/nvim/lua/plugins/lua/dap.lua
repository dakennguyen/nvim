return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
  },
  keys = function()
    local dap, dapui = require "dap", require "dapui"
    return {
      { "<F9>", function() dap.toggle_breakpoint() end },
      {
        "<F21>",
        function() dap.set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
        { desc = "Set Conditional Breakpoint" },
      }, -- <S-F9>
      { "<F5>", function() dap.continue() end },
      {
        "<F17>",
        function()
          dap.terminate()
          dapui.close()
        end,
      }, -- <S-F5>
      { "<F10>", function() dap.step_over() end },
      { "<F11>", function() dap.step_into() end },
      { "<F12>", function() dap.step_out() end },
      { "<leader>dl", function() dap.run_last() end },
      { "<leader>d.", function() dap.run_to_cursor() end },
      { "<leader>dr", function() dap.repl.open() end },
      { mode = { "n", "v" }, "<m-k>", function() dapui.eval() end },
      { "<leader>du", function() dapui.toggle() end },
      { "<leader>de", function() dapui.elements.watches.add() end },
    }
  end,
  config = function()
    local dap, dapui = require "dap", require "dapui"

    dapui.setup()
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

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
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
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
