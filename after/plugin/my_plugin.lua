local win;

function OpenWin()
    -- Create option variables
    local winW = vim.api.nvim_win_get_width(0)
    local winH = vim.api.nvim_win_get_height(0)
    local bufW = math.floor(winW / 1.5)
    local bufH = math.floor((winH - 2) / 1.5)
    --[[ local bufW = 10
    local bufH = 1 ]]
    local title = "Utility"

    -- Create options
    local opts = {
        border = "rounded",
        focusable = true,
        relative = "editor",
        width = bufW,
        height = bufH,
        row = math.floor((winH - bufH) / 2),
        col = math.floor((winW - bufW) / 2),
        style = 'minimal',
        title = title,
        title_pos = "center",
    }

    -- Show floating window
    local buf = vim.api.nvim_create_buf(false, true)
    win = vim.api.nvim_open_win(buf, 0, opts)

    -- Create input field for User
    vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, { "" })
    vim.api.nvim_win_set_cursor(0, { 1, 1 });
    vim.cmd("startinsert")

    -- Listen for input
    vim.keymap.set("i", "<CR>", function()
        local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
        -- TODO process user input
        vim.cmd("stopinsert")
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf })

    vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf })
end

function CloseWin()
    vim.api.nvim_win_close(win, true)
end
