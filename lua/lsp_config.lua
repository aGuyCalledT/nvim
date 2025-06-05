local lsp_zero = require('lsp-zero')
local lspkind = require('lspkind')

lsp_zero.on_attach(function(client, bufnr) end)

lsp_zero.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'lua_ls',
        'ruff_lsp',
    },
    handlers = {
        function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = lspkind.cmp_capabilities(capabilities)

            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
                on_attach = lsp_zero.on_attach,
            })
        end,
    }
})
