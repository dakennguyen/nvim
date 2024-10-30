return {
  "mfussenegger/nvim-dap",
  dependencies = {
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

    local dap = require "dap"

    -- PHP
    -- https://github.com/xdebug/vscode-php-debug#installation
    -- export XDEBUG_SESSION=1
    -- (xdebug.ini) zend_extension=xdebug
    -- (xdebug.ini) xdebug.mode = debug
    -- Start client session with dap and then run phpunit
    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { os.getenv "HOME" .. "/opensources/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
      },
    }
  end,
}
