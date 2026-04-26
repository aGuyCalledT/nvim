vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "sqls" then
            local db_url = os.getenv("DATABASE_URL")
            if db_url then
                -- Ein kleiner Delay hilft dem Server beim "Aufwachen"
                vim.defer_fn(function()
                    client.execute_command({
                        command = "addConnection",
                        arguments = { db_url },
                    })
                end, 500)
            end
        end
    end,
})
