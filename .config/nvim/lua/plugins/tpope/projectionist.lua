return {
  "tpope/vim-projectionist",
  lazy = false, -- NOTE: cannot lazy loading for `drs` command
  keys = {
    { "<space>6", ":A<CR>", silent = true },
    { "c<cr>", ":Console<CR>", silent = true },
    { "c<space>", ":Console " },
  },
  config = function()
    local rails = {
      ["db/schema.rb"] = {
        type = "schema",
      },
      ["config/*.yml"] = {
        type = "env",
      },
      ["config/routes.rb"] = {
        type = "routes",
      },
      ["lib/*.rb"] = {
        alternate = "spec/lib/{}_spec.rb",
        type = "source",
        dispatch = "bundle exec rails runner {file}",
      },
      ["lib/*.rake"] = {
        alternate = "spec/lib/{}_rake_spec.rb",
        type = "source",
        dispatch = "bundle exec rails runner {file}",
      },
      ["app/*.rb"] = {
        alternate = "spec/{}_spec.rb",
        type = "source",
        dispatch = "bundle exec rails runner {file}",
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
        dispatch = "bundle exec rspec {file}",
      },
      ["spec/*_rake_spec.rb"] = {
        alternate = "{}.rake",
        type = "test",
        dispatch = "bundle exec rspec {file}",
      },
      ["spec/requests/*_spec.rb"] = {
        command = "request",
        alternate = "app/controllers/{}_controller.rb",
        type = "test",
        dispatch = "bundle exec rspec {file}",
      },
    }

    local ruby = {
      ["Gemfile"] = {
        alternate = "Gemfile.lock",
        type = "specs",
      },
      ["Gemfile.lock"] = {
        alternate = "Gemfile",
      },
    }

    local php = {
      ["composer.json"] = {
        alternate = "composer.lock",
        type = "specs",
      },
      ["composer.lock"] = {
        alternate = "composer.json",
      },
    }

    local js = {
      ["package.json"] = {
        alternate = "package-lock.json",
        type = "specs",
      },
      ["package-lock.json"] = {
        alternate = "package.json",
      },
    }

    vim.g.projectionist_heuristics = {
      ["bin/rails"] = rails,
      ["Gemfile"] = ruby,
      ["composer.json"] = php,
      ["package.json"] = js,
    }
  end,
}
