vim.g.projectionist_heuristics = {
  ['*'] = {
    ['lib/*.rb'] = {
      alternate = 'spec/lib/{}_spec.rb',
      type = 'source',
    },
    ['lib/*.rake'] = {
      alternate = 'spec/lib/{}_rake_spec.rb',
      type = 'source',
    },
    ['app/*.rb'] = {
      alternate = 'spec/{}_spec.rb',
      type = 'source',
    },
    ['spec/*_rake_spec.rb'] = {
      alternate = '{}.rake',
      type =  'spec',
    },
    ['spec/*_spec.rb'] = {
      alternate = {
        'app/{}.rb',
        '{}.rb',
      },
      type = 'spec',
    },
    ['*.js'] = {
      alternate = {
        '{dirname}/__tests__/{basename}.spec.js',
        '{dirname}/__tests__/integration.spec.js'
      },
      type = 'source',
    },
    ['*/integration.spec.js'] = {
      alternate = '{dirname}/index.js',
      type = 'spec',
    },
    ['*.spec.js'] = {
      alternate = '{dirname}/../{basename}.js',
      type = 'spec',
    }
  }
}
