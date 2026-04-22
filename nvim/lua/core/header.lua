local M = {}

function M.set_winbar(label_text, accent_color)
    local ok, catppuccin = pcall(require, "catppuccin.palettes")
    if not ok then return end
    local cp = catppuccin.get_palette()

    local bar_hl = "WinBar" .. accent_color
    local text_hl = "WinBarText" .. accent_color

    vim.api.nvim_set_hl(0, bar_hl, { bg = cp.surface1, fg = cp.surface1 })
    vim.api.nvim_set_hl(0, text_hl, { bg = cp[accent_color], fg = cp.base, bold = true })

    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_option_value("winhighlight", "WinBar:" .. bar_hl, { win = win })

    local content = "%# " .. bar_hl .. "#%=" .. "%#" .. text_hl .. "#  " .. label_text .. "  " .. "%#" .. bar_hl .. "#%="
    vim.opt_local.winbar = content
end

return M
