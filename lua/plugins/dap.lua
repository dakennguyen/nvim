vim.pack.add { "https://github.com/mfussenegger/nvim-dap" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-float",
  callback = function() buf_map("n", "q", "<cmd>q<CR>", { silent = true }) end,
})

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
  command = os.getenv "HOME" .. "/opt/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
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

-- PHP
-- https://github.com/xdebug/vscode-php-debug#installation
-- export XDEBUG_SESSION=1
-- (xdebug.ini) zend_extension=xdebug
-- (xdebug.ini) xdebug.mode = debug
-- Start client session with dap and then run phpunit
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv "HOME" .. "/opt/vscode-php-debug/out/phpDebug.js" },
}

-- Configurations
-- ======================================
dap.configurations.cpp = {
  {
    name = "Launch (lldb)",
    type = "lldb",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    args = function()
      local args_string = vim.fn.input "Input arguments: "
      return vim.split(args_string, " ")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
  {
    name = "Launch (cppdbg)",
    type = "cppdbg",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    args = function()
      local args_string = vim.fn.input "Input arguments: "
      return vim.split(args_string, " ")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
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

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
  },
}

map("n", "<F9>", function() require("dap").toggle_breakpoint() end)
map("n", "<F21>", function()
  vim.ui.input({ prompt = "Breakpoint condition" }, function(input) require("dap").set_breakpoint(input) end)
end, { desc = "Set Conditional Breakpoint" }) -- <S-F9>
map("n", "<F5>", function() require("dap").continue() end)
map("n", "<F17>", function() require("dap").terminate() end)
map("n", "<F10>", function() require("dap").step_over() end)
map("n", "<F11>", function() require("dap").step_into() end)
map("n", "<F12>", function() require("dap").step_out() end)
map("n", "<leader>dl", function() require("dap").run_last() end)
map("n", "<leader>d.", function() require("dap").run_to_cursor() end)
map("n", "<leader>dr", function() require("dap").repl.toggle() end)
map({ "n", "v" }, "<leader>dh", function() require("dap.ui.widgets").hover() end)
map(
  { "n", "v" },
  "<leader>dp",
  function(expr) require("dap.ui.widgets").preview(expr, { listener = { "scopes" } }) end
)
map({ "n", "v" }, "<Leader>de", function(expr)
  local value = require("utils").eval_expression(expr)
  local view = widgets.sidebar(widgets.expression, {}, "vsplit")
  view.open(value)
  view.__expression = value
end)
map("n", "<Leader>dE", function()
  vim.ui.input({ prompt = "Expression: " }, function(expr)
    if expr then
      local value = require("utils").eval_expression(expr)
      local view = widgets.sidebar(widgets.expression, {}, "vsplit")
      view.open(value)
      view.__expression = value
    end
  end)
end)
