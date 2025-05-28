return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
    },
    cmd = { "DapInstall", "DapUninstall" },
    config = function()
        local mason_dap = require("mason-nvim-dap")
        mason_dap.setup({
            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {
                function(config)
                    mason_dap.default_setup(config);
                end,
                codelldb = function(config)
                    config.configurations = {
                        {
                            name = 'Launch',
                            type = 'codelldb',
                            request = 'launch',
                            program = function()
                                vim.fn.system("zig build")
                                return '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}'
                            end,
                            cwd = '${workspaceFolder}',
                            stopOnEntry = false,
                            args = {},
                        },
                    }
                    mason_dap.default_setup(config);
                end
            },

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                "codelldb",
            },
        })
    end,
}
