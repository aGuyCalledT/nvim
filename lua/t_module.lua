vim.g.mapleader = " "
vim.keymap.set('n', '<leader>rp', ':w | terminal python3 %<CR> | i', { noremap = true, silent = false, desc = "save & run python file in terminal" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<Leader><Esc>', ':w<CR>:Alpha<CR>', { desc = 'save file and returns to home screen' })
