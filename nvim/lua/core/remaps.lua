local M = {}
local runner = require("core.run")

vim.g.mapleader = " "

-- general

vim.keymap.set('n', '<leader>pv', ':NvimTreeToggle<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "open netrw file explorer" })
vim.keymap.set("n", "<leader><Esc>", ":Alpha<CR>", { silent = true, desc = "back to dashboard" })

-- run
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("TerminalCustomRemaps", { clear = true }),
    callback = function()
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>:bd!<CR>]], { buffer = true, silent = true })

        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        require("core.header").set_winbar("TERMINAL", "green")
    end,
})

local run = require("core.run")
vim.keymap.set('n', '<leader>rp', run.run_current_file, { desc = "run current file" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "find git files" })
vim.keymap.set("n", "<leader>gs", function()
    builtin.grep_string({ search = vim.fn.input("grep > ") })
end, { desc = "grep search" })

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "mark current file" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "toggle quick menu" })
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "go to 1st file" })
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = "go to 2nd file" })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = "go to 3rd file" })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = "go to 4th file" })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undotree" })

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = e.buf, desc = "go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { buffer = e.buf, desc = "show hover documentation" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = e.buf, desc = "search workspace symbols" })
        vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end,
            { buffer = e.buf, desc = "diagnostic float" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { buffer = e.buf, desc = "next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { buffer = e.buf, desc = "previous diagnostic" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = e.buf, desc = "show code actions" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = e.buf, desc = "list references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = e.buf, desc = "rename symbol" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = e.buf, desc = "show signature help" })
    end,
})

-- cmp mappings
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

M.cmp_mappings = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

return M
