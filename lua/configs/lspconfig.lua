-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"

local servers = {
    html = {},
    cssls = {},
    volar = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
            vue = {
                hybridMode = false,
            },
            typescript = {
                tsdk = os.getenv "NVM_BIN" .. "/../lib/node_modules/typescript/lib",
            },
            enableTelemetry = true,
        },
    },
}

for name, opts in pairs(servers) do
    opts.on_init = configs.on_init
    opts.on_attach = configs.on_attach
    opts.capabilities = configs.capabilities

    lspconfig[name].setup(opts)
end
