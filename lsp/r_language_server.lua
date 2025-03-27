-- install.packages("languageserver")
return {
  cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
  filetypes = { "r", "rmd", "quarto" },
}
