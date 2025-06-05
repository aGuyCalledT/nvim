local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
    dashboard.button("f", "󰱼  Find", ":Telescope find_files <CR>"),
    dashboard.button("n", "󰫢  New", ":ene <BAR> startinsert <CR>"),
    dashboard.button("h", "󱢺  Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
    dashboard.button("r", "󰋚  History", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Telescope (live_grep)", ":Telescope live_grep <CR>"),
    dashboard.button("m", "󰞵  Mason", ":Mason <CR>"),
    dashboard.button("i", "  Initialization (init.lua)", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("c", "  Configs", ":Telescope find_files cwd=" .. vim.fn.stdpath('config') .. "/lua<CR>"),
    dashboard.button("p", "󰏓  Packer", ":PackerSync <CR>"),
    dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
}

dashboard.section.header.val = {
    "",
    " ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄███▄▄▄▄   ",
    " ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███ ▄██▀▀▀███▀▀▀██▄ ",
    " ███   ███   ███    █▀  ███    ███ ███    ███ ███ ███   ███   ███ ",
    " ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███ ███   ███   ███ ",
    " ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███ ███   ███   ███ ",
    " ███   ███   ███    █▄  ███    ███ ███    ███ ███ ███   ███   ███ ",
    " ███   ███   ███    ███ ███    ███ ███    ███ ███ ███   ███   ███ ",
    "  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀   ▀█   ███   █▀  ",
    "                                                                   ",
    " Welcome back, T!",
    ""
}

dashboard.section.header.opts.hl = "AlphaHeader"
alpha.setup(dashboard.opts)
