local lint = require "lint"

-- eslint_d executes manually in autocmd function
lint.linters_by_ft = {
    css = { "stylelint" },
    scss = { "stylelint" },
    vue = { "stylelint" },
}

local function find_nearest_node_modules_dir()
    -- current buffer dir
    local current_dir = vim.fn.expand "%:p:h"
    while current_dir ~= "/" do
        if vim.fn.isdirectory(current_dir .. "/node_modules") == 1 then
            return current_dir
        end
        current_dir = vim.fn.fnamemodify(current_dir, ":h")
    end
    return nil
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        local ft = vim.bo.filetype
        local js_types = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" }
        if not vim.tbl_contains(js_types, ft) then
            lint.try_lint()
            return
        end

        local original_cwd = vim.fn.getcwd()
        local node_modules_dir = find_nearest_node_modules_dir()
        if node_modules_dir then
            vim.cmd("cd " .. node_modules_dir)
        end

        lint.try_lint "eslint_d"

        vim.cmd("cd " .. original_cwd)

        lint.try_lint()
    end,
})
