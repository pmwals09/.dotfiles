function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- File navigation
-- open a vertical split with file explorer in it
map('n', '<leader>pv', ':Vex<CR>')
map('n', '<leader>pe', ':Ex<CR>')

-- In-file navigation
-- move the visually selected text down a line
map('v', 'J', ":m '>+1<CR>gv=gv")
-- move the visually selected text up a line
map('v', 'K', ":m '<-2<CR>gv=gv")
-- format the file
map('n', '<C-F>', 'gg=G')

-- Config quick source
map('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- quicklist navigation
map('n', '<C-j>', ':cnext<CR>')
map('n', '<C-k>', ':cprev<CR>')

-- Copy and paste is hard
map('v', '<leader>p', '"_dP')
map('n', '<leader>y', '"*y')
-- yank the entire file
map('n', '<leader>Y', 'gg"+yG')

-- fugitive HOT ROUTE
-- open futitive
map('n', '<leader>gs', ':G<CR>')
-- open file diff
map('n', '<leader>gd', ':Gdiff<CR>')
-- open 3-way merge conflict view
map('n', '<leader>gmc', ':Gvdiffsplit!<CR>')
-- bring in the item on the right
map('n', '<leader>gtl', ':diffget //3<CR>')
-- bring in the item on the left
map('n', '<leader>gta', ':diffget //2<CR>')

-- Windows
map('n', 'ff', ':resize 100 <CR> <BAR> :vertical resize 220<CR>')
map('n', 'fm', '<C-w>=')

map('n', '<leader>bd', ':wa <BAR> :%bd <BAR> e# <BAR> bd#<CR>')

-- Emmets
-- insert a checkbox
map('n', '<leader>icb', '^i- [ ] ')
-- check a checkbox
map('n', '<leader>ccb', "^:s/- \\[ \\]/- [x]<CR>:noh<CR>")
-- uncheck a checkbox
map('n', '<leader>ucb', "^:s/- \\[x\\]/- [ ]<CR>:noh<CR>")

-- Vim-Tmux Navigation
map('n', '<C-h>', ':TmuxNavigateLeft<CR>')
map('n', '<C-j>', ':TmuxNavigateDown<CR>')
map('n', '<C-k>', ':TmuxNavigateUp<CR>')
map('n', '<C-l>', ':TmuxNavigateRight<CR>')
