require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {    -- :h background
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = false,       -- enable transparent floating windows
        solid = true,              -- use solid styling for floating windows, see |winborder|
    },
    term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,             -- Force no italic
    no_bold = false,               -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },   -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            DiagnosticSignError = { fg = colors.red },
            DiagnosticSignWarn  = { fg = colors.yellow },
            DiagnosticSignHint  = { fg = colors.blue },
            DiagnosticSignInfo  = { fg = colors.green },

            NormalFloat         = { bg = colors.surface1 },
            FloatBorder         = { bg = colors.surface1, fg = colors.surface1 },

            Pmenu               = { bg = colors.mantle },
            PmenuSel            = { bg = colors.lavender, fg = colors.base, blend = 0, bold = true },
            PmenuSbar           = { bg = colors.surface0 },
            PmenuThumb          = { bg = colors.surface2 },
            CursorLine          = { bg = colors.surface0 },

            Visual              = { bg = colors.surface2, fg = colors.text, bold = true },
            Search              = { bg = colors.surface0, fg = colors.text },
            IncSearch           = { bg = colors.lavender, fg = colors.base },
            CurSearch           = { bg = colors.lavender, fg = colors.base },

            CursorLineNr        = { fg = colors.lavender, bold = true },
        }
    end,
    default_integrations = true,
    auto_integrations = false,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
        native_lsp = {
            enabled = false,
        },
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin-nvim"
