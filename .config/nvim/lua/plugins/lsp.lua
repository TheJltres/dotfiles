return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependdencies = {
        'folke/lazydev.nvim',
        'j-hui/fidget.nvim',
        'saghen/blink.cmp',
        'williamboman/mason.nvim',
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                -- Mappings.
                local opts = { buffer = args.buf, noremap = true, silent = true }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                id = client.id,
                                bufnr = args.buf,
                            })
                        end
                    })
                end
            end
        })
    end
}
