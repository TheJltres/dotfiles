return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
    },
    keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
    },
    config = function()
        local dapui = require("dapui")
        dapui.setup()

        vim.api.nvim_create_user_command("DapCloseUI", function()
            dapui.close()
        end, {})
    end,
}
