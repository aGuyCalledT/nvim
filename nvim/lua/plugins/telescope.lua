local telescope = require('telescope')

telescope.setup({
    defaults = {
        preview = {
            treesitter = false,
        }
    }
})
