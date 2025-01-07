local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "stylelint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        vue = { "eslint_d", "stylelint" },
    },
}

return options
