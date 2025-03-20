return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {  -- Add the languages you need here
                "css",           -- Add CSS
                "html",
                "javascript",
                "json",
                "jsonc",
                -- Add any other languages you need
            },
            autoinstall = true,  -- Automatically install missing parsers
            highlight = {
                enable = true,   -- Enable Treesitter-based highlighting
            },
            indent = {
                enable = true,   -- Enable Treesitter-based indentation
            },
        })
    end
}

