require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
        show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
        },
    },
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
