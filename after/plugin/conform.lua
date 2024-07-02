require("conform").setup({
    formatters_by_ft = {
        typescript = { { "prettierd" } },
        typescriptreact = { { "prettierd" } },
        javascript = { { "prettierd" } },
        javascriptreact = { { "prettierd" } },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
