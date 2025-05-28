return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'saghen/blink.cmp',
    },
    config = function(_, opts)
        require('mason').setup(opts)
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'zls' },
        })
    end
}
