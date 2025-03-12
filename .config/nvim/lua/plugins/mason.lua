return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'saghen/blink.cmp',
    },
    config = function(_, opts)
        require('mason').setup(opts)

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            ensure_installed = { 'lua_ls', 'zls' },
            automatic_installation = true,
        })

        local lspconfig = require('lspconfig')
        mason_lspconfig.setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                }
            end,
            ["html"] = function()
                lspconfig.html.setup({
                    capabilities = capabilities,
                    filetypes = {
                        'html',
                        'zmpl',
                    },
                })
            end,
        }
    end
}
