-- luacheck: globals Snacks
---@diagnostic disable: undefined-global

local icons = require "icons"

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<space>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<space>fe", function() Snacks.picker.explorer() end, desc = "Explorer" },
    { "<space>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<space>fo", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<space>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<space>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<space>fm", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<space>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<space>fq", function() Snacks.picker.qflist() end, desc = "Quickfix list" },
    {
      "<space>fs",
      function() Snacks.picker.files { cwd = "local_scripts" } end,
      desc = "Find scripts",
      mode = { "n", "x" },
    },
    {
      "<space>fn",
      function() Snacks.picker.files { cwd = vim.fs.normalize "$CLOUD/Notes" } end,
      desc = "Find notes",
      mode = { "n", "x" },
    },
    { "//", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "\\", ":Sgrep ", desc = "Grep" },
    {
      "<space>fv",
      function() Snacks.picker.files { cwd = "~/.dotfiles" } end,
      desc = "Find Config File",
    },
    {
      "<space>fp",
      function()
        Snacks.picker.projects {
          dev = _G.dev_paths,
          confirm = "open_pj_fugitive",
          win = {
            preview = { minimal = true },
            input = {
              keys = {
                ["<c-o>"] = { { "tcd", "picker_files_hidden" }, mode = { "n", "i" } },
                ["<c-l>"] = { { "tcd", "restore_session" }, mode = { "n", "i" } },
              },
            },
          },
        }
      end,
      desc = "Projects",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch { ft = "markdown", filekey = { branch = false }, root = vim.fs.normalize "$CLOUD/Notes/scratch" }
      end,
      desc = "Toggle project note",
    },
    { "<space>gs", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>z", function() Snacks.zen.zoom() end },
  },
  opts = {
    input = { enabled = true },
    scratch = { root = vim.fs.normalize "$CLOUD/Notes/scratch" },
    statuscolumn = { enabled = true },
    notifier = { enabled = true },
    image = { enabled = true },
    scope = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true, layout = "ivy" },
        projects = { layout = "select" },
        explorer = {
          include = { "*" },
          win = {
            list = {
              keys = {
                ["L"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
              },
            },
          },
        },
      },
      formatters = {
        file = { truncate = 80 },
      },
      actions = {
        open_pj_fugitive = function(picker, item)
          picker:close()
          if not item then return end
          if vim.bo.filetype ~= "snacks_dashboard" then vim.cmd "tabnew" end

          vim.cmd("tcd" .. item.file .. " | G | only")
        end,
        picker_files_hidden = function(picker, item)
          if not item then return end
          for _, p in ipairs(Snacks.picker.get { source = "files" }) do
            p:close()
          end
          Snacks.picker("files", {
            cwd = Snacks.picker.util.dir(item),
            on_show = function() picker:close() end,
          })
        end,
        restore_session = function(picker, item)
          local filepath = Snacks.picker.util.dir(item) .. "/Session.vim"
          if not vim.loop.fs_stat(filepath) then
            vim.notify("No sessions", vim.log.levels.WARN)
            return
          end

          picker:close()
          vim.cmd("source " .. Snacks.picker.util.dir(item) .. "/Session.vim")
        end,
      },
    },
    dashboard = {
      enabled = false,
      preset = {
        keys = {
          { icon = icons.misc.git_branch, key = "g", desc = "Git status", action = ":tab G | tabonly" },
          {
            icon = icons.misc.search,
            key = "f",
            desc = "Find File",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          { icon = icons.symbol_kinds.File, key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = icons.symbol_kinds.Folder,
            key = "e",
            desc = "Explorer",
            action = ":lua Snacks.dashboard.pick('explorer')",
          },
          { icon = icons.misc.refresh, key = "s", desc = "Restore Session", action = require("utils").load_session },
          { icon = icons.misc.sign_out, key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = icons.misc.keyboard, title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = icons.symbol_kinds.File, title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        {
          icon = icons.misc.project,
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 1,
          action = function(dir)
            vim.fn.chdir(dir)
            vim.cmd "new | G | only"
          end,
        },
        { section = "startup" },
      },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command(
      "Sgrep",
      function(o) Snacks.picker.grep_word { search = o.args } end,
      { nargs = "?" }
    )

    require("snacks").setup(opts)
  end,
}
