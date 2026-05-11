local M = {}

M.run_current_file = function()
    vim.cmd("write")
    local ft = vim.bo.filetype
    local fname = vim.fn.expand("%")
    local fname_no_ext = vim.fn.expand("%:r")

    local function get_java_cmd()
        local dir = vim.fn.expand("%:p:h")
        local fname_no_ext = vim.fn.expand("%:t:r")

        local jars = vim.fn.globpath(dir, "*.jar", false, true)
        local cp_table = { "." }
        for _, jar in ipairs(jars) do
            table.insert(cp_table, jar)
        end

        local classpath = table.concat(cp_table, ":")

        return string.format(
            "cd '%s' && javac -cp '%s' Env.java GetID.java Main.java && java -cp '%s' %s",
            dir, classpath, classpath, fname_no_ext
        )
    end

    local cmds = {
        python = "python3 " .. fname,
        sh = "bash " .. fname,
        bash = "bash " .. fname,
        lua = "source " .. fname,
        java = get_java_cmd()
    }

    local command = cmds[ft]

    if command then
        if ft == "lua" then
            vim.cmd(command)
        else
            vim.cmd("split | term " .. command)
            vim.cmd("startinsert")
        end
    else
        print("no defined run for '" .. ft .. "'")
    end
end

return M
