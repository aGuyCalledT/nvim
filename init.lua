-- Bootstrap Packer if not installed
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
    vim.cmd('packadd packer.nvim')
    return
end

-- Plugin definitions
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { "catppuccin/nvim", as = "catppuccin", config = function()
        require("catppuccin").setup({
            flavor = "macciato",
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = {
                    enabled = true,
                },
                harpoon = true,
            },
            custom_highlights = function (colors)
                return {
                    Normal = { bg = "#1d1d1d", fg = colors.text},
                    EndOfBuffer = { bg = "#1d1d1d"},
                }
            end,
        })
        vim.cmd('colorscheme catppuccin')
    end}
    use 'nvim-lualine/lualine.nvim'
    use 'goolord/alpha-nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('ThePrimeagen/harpoon')
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind.nvim'
    use 'hrsh7th/cmp-nvim-lua'
    use 'VonHeikemen/lsp-zero.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
end)

-- External configuration files
require("options")
require("diagnostics_config")
require("lsp_config")
require("cmp_config")
require("alpha_config")
require("colors")
require("lualine_config")
require("harpoon_config")
require("telescope")
require("treesitter")
require("undotree")
require("vim-fugitive")
require("lsp")
require("t_module")
