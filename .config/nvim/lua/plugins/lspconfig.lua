return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependdencies = {
        'folke/lazydev.nvim',
        'j-hui/fidget.nvim',
        'saghen/blink.cmp',
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                -- Mappings
                local opts = { buffer = args.buf, noremap = true, silent = true }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
            end
        })
    end
}
