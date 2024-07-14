require("formatter").setup {
    filetype = {
        javascript = {
            require("formatter.filetypes.javascript").prettierd
        },
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd
        },
        typescript = {
            require("formatter.filetypes.typescript").prettierd
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd
        }
    }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "FormatWriteLock"
})
