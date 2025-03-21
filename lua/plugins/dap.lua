return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F9>", function() require("dap").toggle_breakpoint() end },
    {
      "<F21>",
      function()
        vim.ui.input({ prompt = "Breakpoint condition" }, function(input) require("dap").set_breakpoint(input) end)
      end,
      { desc = "Set Conditional Breakpoint" },
    }, -- <S-F9>
    { "<F5>", function() require("dap").continue() end },
    { "<F17>", function() require("dap").terminate() end }, -- <S-F5>
    { "<F10>", function() require("dap").step_over() end },
    { "<F11>", function() require("dap").step_into() end },
    { "<F12>", function() require("dap").step_out() end },
    { "<leader>dl", function() require("dap").run_last() end },
    { "<leader>d.", function() require("dap").run_to_cursor() end },
    { "<leader>dr", function() require("dap").repl.toggle() end },
    { mode = { "n", "v" }, "<leader>dh", function() require("dap.ui.widgets").hover() end },
    -- {
    --   mode = { "n", "v" },
    --   "<leader>dp",
    --   function(expr) require("dap.ui.widgets").preview(expr, { listener = { "scopes" } }) end,
    -- },
    {
      mode = { "n", "v" },
      "<Leader>de",
      function(expr)
        local value = require("utils").eval_expression(expr)
        local widgets = require "dap.ui.widgets"
        local view = widgets.sidebar(widgets.expression, {}, "vsplit")
        view.open(value)
        view.__expression = value
      end,
    },
    {
      "<Leader>dE",
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then
            local value = require("utils").eval_expression(expr)
            local widgets = require "dap.ui.widgets"
            local view = widgets.sidebar(widgets.expression, {}, "vsplit")
            view.open(value)
            view.__expression = value
          end
        end)
      end,
    },
    "<leader>ds",
    "<leader>df",
  },
  config = function()
    local widgets = require "dap.ui.widgets"
    local scopes = widgets.sidebar(widgets.scopes, {}, "vsplit")
    local frames = widgets.sidebar(widgets.frames, { height = 10 }, "belowright split")

    map("n", "<leader>ds", scopes.toggle)
    map("n", "<leader>df", frames.toggle)

    local dap = require "dap"

    -- Adapters
    -- ======================================
    dap.adapters.lldb = {
      type = "executable",
      command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
      name = "lldb",
    }
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = os.getenv "HOME" .. "/opensources/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }
    dap.adapters.delve = function(callback, config)
      if config.mode == "remote" and config.request == "attach" then
        callback {
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or "38697",
        }
      else
        callback {
          type = "server",
          port = "${port}",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
            detached = vim.fn.has "win32" == 0,
          },
        }
      end
    end

    -- Configurations
    -- ======================================
    dap.configurations.cpp = {
      {
        name = "Launch (lldb)",
        type = "lldb",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
      {
        name = "Launch (cppdbg)",
        type = "cppdbg",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      -- works with go.mod packages and sub packages
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }
  end,
}
