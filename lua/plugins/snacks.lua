-- luacheck: globals Snacks
---@diagnostic disable: undefined-global

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<space>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<space>fm", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<space>fq", function() Snacks.picker.qflist() end, desc = "Quickfix list" },
    { "//", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<space>fp", function() Snacks.picker.projects() end, { desc = "Projects" } },
    { "<leader>z", function() Snacks.zen.zoom() end },
  },
  opts = {
    statuscolumn = { enabled = true },
    image = {
      enabled = true,
      doc = { inline = false },
    },
    scope = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        projects = {
          layout = "select",
          dev = _G.dev_paths,
          confirm = "open_project",
          win = {
            preview = { minimal = true },
            input = {
              keys = {
                ["<c-o>"] = { { "tcd", "picker_files_hidden" }, mode = { "n", "i" } },
                ["<c-l>"] = { { "tcd", "restore_session" }, mode = { "n", "i" } },
                ["<c-t>"] = { { "open_project_new_tab" }, mode = { "n", "i" } },
              },
            },
          },
        },
      },
      formatters = {
        file = { truncate = 80 },
      },
      actions = {
        open_project = function(picker, item)
          picker:close()
          if not item then return end
          if vim.bo.filetype ~= "snacks_dashboard" then vim.cmd "tabnew" end

          vim.cmd("tcd" .. item.file .. " | G | only | tabonly")
        end,
        open_project_new_tab = function(picker, item)
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
  },
}
