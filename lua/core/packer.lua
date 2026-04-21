vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x', -- Hier branch statt tag
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        as = "treesitter",
        run = ":TSUpdate"

    })

    use({
        "theprimeagen/harpoon",
        as = "harpoon"
    })

    use({
        "mbbill/undotree",
        as = "undotree"
    })

    use {
        "williamboman/mason.nvim",
        as = "mason",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
            "stevearc/conform.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        }
    }

    use {
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.alpha")
        end
    }
end)
