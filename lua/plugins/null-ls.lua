-- FILE: lua/plugins/null-ls.lua
return {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
                "nvim-lua/plenary.nvim",
                "nvimtools/none-ls-extras.nvim", -- ESLint, Flake8, etc. now live here :contentReference[oaicite:1]{index=1}
        },
        config = function()
                local null_ls = require("null-ls")
                local formatting = null_ls.builtins.formatting
                local diagnostics = null_ls.builtins.diagnostics

                -- import extras-builtins for JS & Python linters:
                local eslint_d = require("none-ls.diagnostics.eslint_d")
                local flake8 = require("none-ls.diagnostics.flake8")
                -- markdownlint is still in core:
                --local markdownlint = diagnostics.markdownlint

                null_ls.setup({
                        sources = {
                                -- ─── FORMATTERS ───────────────────────────────────────────
                                formatting.prettier.with({
                                        filetypes = { "javascript", "typescript", "markdown" },
                                }),
                                formatting.black.with({ extra_args = { "--fast" } }),
                                formatting.stylua,

                                -- C / C++: use your .clang-format for real-tab, 8-space style
                                formatting.clang_format.with({
                                        extra_args = { "-style=file" },
                                }),

                                -- ─── DIAGNOSTICS / LINTERS ─────────────────────────────────
                                -- JS/TS:
                                eslint_d.with({
                                        -- you can pass .with({ extra_args = {...} }) here if needed
                                }),
                                -- Python:
                                flake8.with({
                                        extra_args = { "--max-line-length=120" },
                                }),
                                -- Markdown:
                                --markdownlint,
                                -- C/C++ diagnostics come from clangd via your LSP setup,
                                -- so we don’t add cpplint here to keep things simple.
                        },

                        on_attach = function(client, bufnr)
                                -- disable clangd’s formatter if clangd is attached
                                if client.name == "clangd" then
                                        client.server_capabilities.documentFormattingProvider = false
                                end

                                -- auto-format on save if formatting is supported
                                if client.supports_method("textDocument/formatting") then
                                        vim.api.nvim_create_augroup("LspFormatting", { clear = true })
                                        vim.api.nvim_create_autocmd("BufWritePre", {
                                                group = "LspFormatting",
                                                buffer = bufnr,
                                                callback = function()
                                                        vim.lsp.buf.format({ bufnr = bufnr })
                                                end,
                                        })
                                end
                        end,
                })
        end,
}
