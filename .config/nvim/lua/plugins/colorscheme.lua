return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = -1,
    opts = {
        commentStyle = { italic = false, },
        keywordStyle = { italic = false, },
        statementStyle = { bold = false, },
        terminalColors = false,
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = 'none',
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require('kanagawa').setup(opts)

        vim.cmd.colorscheme('kanagawa');
    end
}
