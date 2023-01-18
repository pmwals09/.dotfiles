require('fzf-lua').setup{
    winopts = {
        height = 0.8,
        width = 0.8
    },
    fzf_opts = {['--layout'] = 'reverse-list'}
}


map('n', '<C-p>', "<cmd>lua require('fzf-lua').git_files()<CR>")
map('n', '<leader>pf', "<cmd>lua require('fzf-lua').files()<CR>")
map('n', '<leader>lds', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
