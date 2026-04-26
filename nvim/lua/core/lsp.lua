local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup_server(name, config)
    config = config or {}
    config.capabilities = capabilities
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "",
            [vim.diagnostic.severity.INFO]  = "",
        },
    },
    virtual_text = false,
    float = { border = "rounded" },
})

setup_server("pyright")
setup_server("bashls")

setup_server("jdtls", {
    root_dir = vim.fs.root(0, { ".git", "pom.xml", "gradlew" }),
})
