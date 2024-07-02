local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({
    ui = {
        border = "rounded",
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            local config = require('lspconfig')
            if server_name == 'jdtls' then
                config[server_name].setup({
                    root_dir = function(fname)
                        local primary = config.util.root_pattern("Main.java")(fname)
                        return primary or vim.fn.getcwd()
                    end
                })
                -- elseif server_name == 'tsserver' then
                --     config[server_name].setup({
                --         on_init = function(client)
                --             client.server_capabilities.documentFormattingProvider = false
                --             client.server_capabilities.documentFormattingRangeProvider = false
                --         end,
                --     })
            else
                config[server_name].setup({})
            end
        end,
    },
})

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
