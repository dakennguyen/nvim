return {
  "tpope/vim-projectionist",
  lazy = false, -- NOTE: cannot lazy loading for `drs` command
  config = function()
    map("n", "<space>a", ":A<CR>", { silent = true })

    vim.g.projectionist_heuristics = {
      ["*"] = {
        -- http
        ["*.http"] = {
          alternate = ".env",
        },
        -- rails
        ["lib/*.rb"] = {
          alternate = "spec/lib/{}_spec.rb",
          type = "source",
        },
        ["lib/*.rake"] = {
          alternate = "spec/lib/{}_rake_spec.rb",
          type = "source",
        },
        ["app/*.rb"] = {
          alternate = "spec/{}_spec.rb",
          type = "source",
        },
        ["app/controllers/*_controller.rb"] = {
          alternate = {
            "spec/requests/{}_spec.rb",
            "spec/controllers/{}_controller_spec.rb",
          },
          related = {
            "app/models/{singular}.rb",
            "app/views/{basename}",
            "app/policies/{singular}_policy.rb",
            "app/helpers/{singular}_helper.rb",
          },
          type = "controller",
        },
        ["app/models/*.rb"] = {
          related = {
            "app/controllers/{plural}_controller.rb",
            "app/views/{plural}",
            "app/policies/{}_policy.rb",
          },
          type = "model",
        },
        ["app/views/*"] = {
          alternate = "app/controllers/{dirname}_controller.rb",
          type = "view",
        },
        ["app/policies/*_policy.rb"] = {
          related = {
            "app/models/{}.rb",
            "app/views/{plural}",
            "app/controllers/{plural}_controller.rb",
          },
          type = "policy",
        },
        ["app/helpers/*_helper.rb"] = {
          related = {
            "app/models/{}.rb",
            "app/views/{plural}",
            "app/controllers/{plural}_controller.rb",
            "app/policies/{}_policy.rb",
          },
          type = "helper",
        },
        ["spec/*_spec.rb"] = {
          alternate = {
            "app/{}.rb",
            "{}.rb",
          },
          type = "test",
        },
        ["spec/*_rake_spec.rb"] = {
          alternate = "{}.rake",
          type = "test",
        },
        ["spec/requests/*_spec.rb"] = {
          command = "request",
          alternate = "app/controllers/{}_controller.rb",
          type = "test",
        },
      },
    }
  end,
}
