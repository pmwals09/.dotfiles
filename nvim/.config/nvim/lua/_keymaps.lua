function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- File navigation
map('n', '<leader>pv', ':Vex<CR>')
map('n', '<leader>pe', ':Ex<CR>')
map('n', '<C-p>', ':GFiles<CR>')
map('n', '<leader>pf', ':Files<CR>')

-- In-file navigation
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', '<C-F>', 'gg=G')

-- Config quick source
map('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- quicklist navigation
map('n', '<C-j>', ':cnext<CR>')
map('n', '<C-k>', ':cprev<CR>')

-- Copy and paste is hard
map('v', '<leader>p', '"_dP')
map('n', '<leader>y', '"*y')
map('n', '<leader>Y', 'gg"+yG')

-- fugitive HOT ROUTE
map('n', '<leader>gs', ':G<CR>')

-- Windows
map('n', 'ff', ':resize 100 <CR> <BAR> :vertical resize 220<CR>')
map('n', 'fm', '<C-w>=')

