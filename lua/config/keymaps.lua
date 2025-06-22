local M = {}
-- Use space as leader
vim.g.mapleader = " "

-- Example: <leader>pv to open netrw file explorer
vim.keymap.set("n", "<leader>fx", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Show diagnostics in quickfix list" })


function M.setup_lsp_keymaps(bufnr)
        local opts = { buffer = bufnr, remap = false }
        local keymap = vim.keymap.set

        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap("n", "]d", vim.diagnostic.goto_next, opts)
        keymap("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
        end, opts)
end

return M
