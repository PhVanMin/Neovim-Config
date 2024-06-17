-- Define a function to get the next character
function getNext()
    local cursor = vim.api.nvim_win_get_cursor(0)
    table.unpack = table.unpack or unpack
    local line = vim.api.nvim_get_current_line()
    local _, col = table.unpack(cursor)
    local next = string.sub(line, col + 2, col + 2)
    if next == nil then
        print("Nil")
    else
        print(next)
    end
end
