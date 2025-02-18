return {
  "ahmedkhalf/project.nvim",
  name = "project_nvim",
  lazy = false,
  dependencies = "ibhagwan/fzf-lua",
  keys = {
    {
      "<space>fp",
      function()
        local fzf = require "fzf-lua"
        fzf.fzf_exec(function(add_to_results)
          local contents = require("project_nvim").get_recent_projects()
          for _, project in pairs(contents) do
            add_to_results(project)
          end
          -- close the fzf named pipe, this signals EOF and terminates the fzf "loading" indicator.
          add_to_results()
        end, {
          prompt = "Projects> ",
          actions = {
            ["default"] = function(choice)
              vim.cmd.cd(choice[1])
              vim.cmd "e. | G | only | tabonly"
            end,
            ["ctrl-o"] = function(selected) fzf.files { cwd = selected[1] } end,
            ["ctrl-x"] = {
              function(choice) require("project_nvim.utils.history").delete_project { value = choice[1] } end,
              fzf.actions.resume,
            },
          },
        })
      end,
    },
  },
  config = true,
}
