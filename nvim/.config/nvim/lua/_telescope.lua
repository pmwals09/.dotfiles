map('n', '<C-p>', "<cmd>lua require('telescope.builtin').git_files()<CR>")
map('n', '<leader>pf', "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>lds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
map('n', '<leader>rg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
