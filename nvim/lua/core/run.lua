local M = {}

M.run_current_file = function()
    vim.cmd("write")
    local ft = vim.bo.filetype
    local fname = vim.fn.expand("%")

    local cmds = {
        python = "python3 " .. fname,
        sh = "bash " .. fname,
        bash = "bash " .. fname,
        java = "java " .. fname,
        lua = "source " .. fname
    }

    local command = cmds[ft]

    if command then
        if ft == "lua" then
            vim.cmd(command)
        else
            -- Einfach nur das Terminal öffnen
            vim.cmd("term " .. command)
            vim.cmd("startinsert")
        end
    else
        print("Kein Run-Befehl für " .. ft .. " definiert.")
    end
end

return M
