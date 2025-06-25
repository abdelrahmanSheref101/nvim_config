-- FILE: lua/plugins/mason.lua
return {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
                "jay-babu/mason-null-ls.nvim",
        },
        config = function()
                require("mason").setup()
                require("mason-null-ls").setup({
                        ensure_installed = {
                                -- FORMATTERS
                                "prettier",
                                "stylua",
                                "black",
                                "clang-format",
                                -- LINTERS
                                "eslint_d",
                                "flake8",
                                "markdownlint",
                                "cpplint", -- ✅ Add this
                        },
                        automatic_installation = true,
                })
        end,
}
