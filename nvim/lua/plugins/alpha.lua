local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local raw_version = vim.version()
local version = string.format(" v%d.%d.%d", raw_version.major, raw_version.minor, raw_version.patch)

local function sync_colors()
    vim.api.nvim_set_hl(0, "footerColor", { fg = vim.g.terminal_color_15 or "#cad3f5", bg = "NONE" })
    vim.api.nvim_set_hl(0, "headerColor", { fg = vim.g.terminal_color_2 or "#cad3f5", bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = sync_colors,
})
sync_colors()

dashboard.section.header.val = {
    [[]], [[]], [[]],
    [[]], [[]], [[]],
    [[╭───────────────────────── Nvim ─────────────────────────╮]],
    [[│                      welcome back T!                   │]],
    [[╰────────────────────────────────────────────────────────╯]],
}
dashboard.section.header.opts.hl = "headerColor"

local function get_last_file()
    pcall(vim.cmd, "rshada!")

    local oldfiles = vim.v.oldfiles
    if oldfiles and #oldfiles > 0 then
        local last_file = oldfiles[1]
        local display_name = vim.fn.fnamemodify(last_file, ":t")
        return last_file, display_name
    end
    return nil, "none"
end

local last_path, last_name = get_last_file()

dashboard.section.buttons.val = {
    dashboard.button("r", "󱐋  [" .. (last_name or "none") .. "]", ":e " .. (last_path or "") .. "<CR>"),
    dashboard.button("e", "󱢺  harpoon menu", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
    dashboard.button("g", "  git projects", ":e ~/git<CR>"),
    dashboard.button("f", "󰱼  find file", ":Telescope find_files <CR>"),
    dashboard.button("t", "󱎸  text search", ":Telescope live_grep <CR>"),
    dashboard.button("h", "  file history", ":Telescope oldfiles <CR>"),
    dashboard.button("c", "  configs", ":Telescope find_files cwd=~/.config/nvim <CR>"),
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

    local date_text = os.date("%d.%m.%Y")
    local plugins_text = count .. " plugins"
    local content = string.format("󰃭 %s  |   %s  |  %s", date_text, plugins_text, version)

    local width = 54
    local padding = string.rep(" ", math.floor((width - #content + 6) / 2))

    local line = "│" .. padding .. content
    line = line .. string.rep(" ", 58 - #line + 7) .. "│"

    return {
        [[]],
        [[╭───────────────────────────────────────────────────────╮]],
        line,
        [[╰───────────────────────────────────────────────────────╯]],
    }
end)()
dashboard.section.footer.opts.hl = "footerColor"

alpha.setup(dashboard.config)
