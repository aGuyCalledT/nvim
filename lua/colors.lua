vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, 'LualineModeFaintNormal', { bg = '#363a4f', fg = '#cad3f5' }) -- Catppuccin Macchiato Base für Normal-Modus
vim.api.nvim_set_hl(0, 'LualineModeFaintInsert', { bg = '#494d64', fg = '#cad3f5' }) -- Catppuccin Macchiato Mantle für Insert-Modus
