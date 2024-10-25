local lint = require "lint"

-- lint.linters.stylelint.args = {
--   "--config",
--   ".stylelintrc.json",
-- }

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  css = { "stylelint" },
  scss = { "stylelint" },
  vue = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
