-- go install github.com/sqls-server/sqls@latest
return {
  cmd = { "sqls" },
  filetypes = { "sql", "mysql" },
  single_file_support = true,
  settings = {
    sqls = {
      connections = {
        {
          driver = "postgresql",
          dataSourceName = vim.g.db,
        },
      },
    },
  },
}
