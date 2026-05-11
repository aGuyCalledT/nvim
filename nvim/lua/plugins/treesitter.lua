local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

ts.setup({
    ensure_installed = {
        "lua", "vim", "vimdoc", "javascript", "typescript",
        "html", "css", "json", "python", "bash", "go", "java"
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

local status_txt, txtobj = pcall(require, "nvim-treesitter-textobjects")
if status_txt then
    txtobj.setup({
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
            },
        },
    })
end
