local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

local golangci_lint = {
  lintCommand = "golangci-lint run ${INPUT}",
  lintStdin = true,
}

local flake8 = {
  lintCommand = "flake8 ${INPUT}",
  lintStdin = true,
}

local black = {
  formatCommand = "black --quiet -",
  formatStdin = true,
}

local luacheck = {
  lintCommand = "luacheck --codes --no-color --quiet -",
  lintStdin = true,
  lintFormats = { "%.%#:%l:%c: (%t%n) %m" },
}

local stylua = {
  formatCommand = "stylua --search-parent-directories -",
  formatStdin = true,
}

local phpcs = {
  lintCommand = "./vendor/bin/phpcs --no-colors --report=emacs --stdin-path=${INPUT} -",
  lintStdin = true,
  lintFormats = { "%.%#:%l:%c: %trror - %m", "%.%#:%l:%c: %tarning - %m" },
  rootMarkers = { ".phpcs.xml", "phpcs.xml", ".phpcs.xml.dist", "phpcs.xml.dist", "composer.json" },
}

local phpcbf = {
  formatCommand = "./vendor/bin/phpcbf -q - || true",
  formatStdin = true,
}

local phpstan = {
  lintCommand = "./vendor/bin/phpstan analyse --no-progress --no-ansi --error-format=raw ${INPUT}",
  lintStdin = false,
  lintFormats = { "%.%#:%l:%m" },
  rootMarkers = { 'phpstan.neon', 'phpstan.neon.dist', 'composer.json' },
}

-- `npm install -g eslint_d`
-- `brew install efm-langserver`
-- `brew install stylua`
-- `brew install luacheck`
-- `go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest`
-- `pip install flake8`
return {
  cmd = { "efm-langserver" },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      javascript = { eslint },
      javascriptreact = { eslint },
      typescript = { eslint },
      typescriptreact = { eslint },
      go = { golangci_lint },
      python = { flake8, black },
      lua = { luacheck, stylua },
      php = { phpcs, phpcbf, phpstan },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "go",
    "python",
    "lua",
    "php",
  },
  init_options = { documentFormatting = true, codeAction = true },
}
