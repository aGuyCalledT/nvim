local function setup_diagnostic_signs()
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError', numhl = '' })
    vim.fn.sign_define('DiagnosticSignWarn',  { text = '󰶴 ', texthl = 'DiagnosticSignWarn',  numhl = '' })
    vim.fn.sign_define('DiagnosticSignInfo',  { text = '󰁦 ', texthl = 'DiagnosticSignInfo',  numhl = '' })
    vim.fn.sign_define('DiagnosticSignHint',  { text = ' ', texthl = 'DiagnosticSignHint',  numhl = '' })
end

vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = '#f38ba8' }) -- Catppuccin Red
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn',  { fg = '#fab387' }) -- Catppuccin Orange
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo',  { fg = '#89b4fa' }) -- Catppuccin Blue
vim.api.nvim_set_hl(0, 'DiagnosticSignHint',  { fg = '#a6e3a1' }) -- Catppuccin Green

vim.diagnostic.config({
    float = {
        focusable = false,
        style = 'minimal',
        border = 'single',
        source = false,
        header = false,
        prefix = '󰋇 ',
    },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = setup_diagnostic_signs,
    once = true, -- Only run once
})
