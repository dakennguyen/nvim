vim.pack.add {
  { src = "https://github.com/folke/snacks.nvim", version = "stable" },
}

-- luacheck: globals Snacks
---@diagnostic disable: undefined-global

require("snacks").setup {
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
}

vim.keymap.set("n", "<space>fh", Snacks.picker.help, { desc = "Help" })
vim.keymap.set("n", "<space>fm", Snacks.picker.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<space>fq", Snacks.picker.qflist, { desc = "Quickfix list" })
vim.keymap.set("n", "<space>fp", Snacks.picker.projects, { desc = "Projects" })
vim.keymap.set("n", "<leader>z", Snacks.zen.zoom, { desc = "Zoom" })
vim.keymap.set("n", "//", Snacks.picker.lines, { desc = "Buffer Lines" })
