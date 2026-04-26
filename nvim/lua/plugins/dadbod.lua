local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        group = vim.api.nvim_create_augroup("AutoDadbodEnv", { clear = true }),
        callback = function()
            local current_file_dir = vim.fn.expand('%:p:h')
            local env_path = vim.fn.findfile('.env', current_file_dir .. ';')

            if env_path == "" then return end

            local db_url = nil
            local env_file = io.open(env_path, "r")
            if env_file then
                for line in env_file:lines() do
                    if line:match("^DATABASE_URL=") then
                        db_url = line:gsub("^DATABASE_URL=", "")
                        db_url = db_url:gsub('"', ''):gsub("'", "")
                        break
                    end
                end
                env_file:close()
            end

            if db_url and db_url ~= "" then
                local user, pass, host, port, db = db_url:match("mysql://(.-):(.-)@(.-):(.-)/(.*)")

                local check_cmd
                if user and pass and host and db then
                    check_cmd = string.format("mariadb -u'%s' -p'%s' -h'%s' -P'%s' '%s' -e 'SELECT 1' > /dev/null 2>&1",
                        user, pass, host, port, db)
                else
                    check_cmd = "false"
                end

                local exit_code = os.execute(check_cmd)

                if exit_code == 0 then
                    vim.b.db = db_url
                    local db_name = db_url:match(".*/(.*)$") or "Unknown DB"
                    vim.notify("[dadbod] database linked: " .. db_name, vim.log.levels.INFO)
                else
                    local masked_url = db_url:gsub(":(.-)@", ":****@")
                    vim.notify("[dadbod] connection failed for: " .. masked_url, vim.log.levels.WARN)
                end
            end
        end,
    })
end

M.setup()

return M
