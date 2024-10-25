local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "stylelint" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    vue = { "eslint_d" },
  },

  -- formatters = {
  --   stylelint = {
  --     args = { "--config", ".stylelintrc.json" },
  --   },
  -- },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 10000,
  --   lsp_fallback = true,
  -- },
}

return options
