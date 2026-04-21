local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function sync_colors()
    vim.api.nvim_set_hl(0, "AlphaHeaderCol", { fg = vim.g.terminal_color_2 or "#a6da95" })
    vim.api.nvim_set_hl(0, "AlphaFooterCol", { fg = vim.g.terminal_color_7 or "#a5adcb" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = sync_colors,
})

sync_colors()

dashboard.section.header.val = {
    [[]], [[]], [[]],
    [[          .          .          ]],
    [[        ';;,.        ::'        ]],
    [[      ,:::;,,        :ccc,      ]],
    [[     ,::c::,,,,.     :cccc,     ]],
    [[     ,cccc:;;;;;.    cllll,     ]],
    [[     ,cccc;.;;;;;,   cllll;     ]],
    [[     :cccc; .;;;;;;. coooo;     ]],
    [[     ;llll;   ,:::::'loooo;     ]],
    [[     ;llll:    ':::::loooo:     ]],
    [[     :oooo:     .::::llodd:     ]],
    [[     .;ooo:       ;cclooo:.     ]],
    [[       .;oc        'coo;.       ]],
    [[         .'          .,.        ]],
}
dashboard.section.header.opts.hl = "AlphaHeaderCol"

dashboard.section.buttons.val = {
    dashboard.button("f", "󰱼  find file", ":Telescope find_files <CR>"),
    dashboard.button("h", "  file history", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "󱎸  text search", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  configs", ":Telescope find_files cwd=~/.config/nvim <CR>"),
    dashboard.button("g", "  git projects",
        ":Telescope find_files cwd=~/git find_command=find,.,-maxdepth,1,-type,d,-not,-path,.,-printf,%P\\n <CR>"),
    dashboard.button("p", "  packer", ":PackerSync<CR>"),
    dashboard.button("m", "󱋖  mason", ":Mason<CR>"),
    dashboard.button("q", "󰈆  quit", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "Normal"
    button.opts.hl_shortcut = "Normal"
end

dashboard.section.footer.val = (function()
    local handle = io.popen(
        "ls -1 ~/.local/share/nvim/site/pack/packer/start ~/.local/share/nvim/site/pack/packer/opt 2>/dev/null | wc -l")
    local count = handle:read("*a"):gsub("%s+", "")
    handle:close()
    return os.date("󰃭 %d.%m.%Y") .. "   " .. count .. " plugins"
end)()

dashboard.section.footer.opts.hl = "AlphaFooterCol"

alpha.setup(dashboard.config)
