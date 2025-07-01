return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        ensure_installed = {
            "c",
            "lua",
            "bash",
            "zig",
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.multibase = {
            install_info = {
                url = "~/Documents/git/thejltres/tree-sitter-multibase/", -- local path or git repo
                files = { "src/parser.c" },                               -- note that some parsers also require src/scanner.c or src/scanner.cc
                -- optional entries:
                branch = "main",                                          -- default branch in case of git repo if different from master
                generate_requires_npm = false,                            -- if stand-alone parser without npm dependencies
                requires_generate_from_grammar = false,                   -- if folder contains pre-generated src/parser.c
            },
            filetype = "mb",                                              -- if filetype does not match the parser name
        }
    end
}
