require("core.packer")

vim.opt.guicursor = "a:block,a:blinkwait700-blinkoff400-blinkon250"
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")

vim.opt.shada = "!,'100,<50,s10,h"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣"
}

vim.opt.colorcolumn = "0"
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.fileencoding = "utf-8"
vim.opt.pumheight = 10
vim.opt.cmdheight = 2
vim.opt.iskeyword:append("-")

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

require("core.remaps")
require("core.nvim_tree")
require("core.run")
require("core.lsp")
