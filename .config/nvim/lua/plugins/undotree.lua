return {
    'mbbill/undotree',
    init = function()
        vim.g.undotree_WindowLayout = 3
    end,
    config = function()
        vim.keymap.set('n', '<leader>u', function()
            vim.cmd.UndotreeToggle()
            vim.cmd.UndotreeFocus()
        end)
    end
}
