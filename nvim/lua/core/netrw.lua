vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 50
vim.g.netrw_altv = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\.\([^./]\|\.\.\@!\)\S*]]

local function apply_netrw_style()
    local ok, catppuccin = pcall(require, "catppuccin.palettes")
    if not ok then return end
    local cp = catppuccin.get_palette()

    local highlights = {
        netrwDir      = { fg = cp.blue, bold = true },
        netrwPlain    = { fg = cp.text },
        netrwExe      = { fg = cp.red },
        netrwSymlink  = { fg = cp.teal },
        netrwLink     = { fg = cp.overlay1 },
        netrwHeader   = { fg = cp.surface0 },
        netrwClassify = { fg = cp.text },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    if vim.bo.filetype == "netrw" then
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_set_hl(0, "NetrwNormal", { fg = cp.text })
        vim.api.nvim_set_option_value("winhighlight", "Normal:NetrwNormal", { win = win })
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        apply_netrw_style()

        require("core.header").set_winbar("NETRW", "peach")

        local opts = { remap = true, buffer = true, silent = true }
        local bind = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, opts) end

        bind("L", "<CR>")
        bind("H", "-")
        bind("a", "%")
        bind("r", "R")
        bind("d", "D")
        bind(".", "gh")

        local legend = " [L] Open  [H] Up  [a] New  [r] Rename  [d] Delete  [.] Toggle Hide "
        vim.opt_local.statusline = legend .. "%=%l/%L "
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = apply_netrw_style,
})
