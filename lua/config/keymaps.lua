local M = {}
-- Use space as leader
vim.g.mapleader = " "

-- to open file explorer
vim.keymap.set("n", "<leader>fx", vim.cmd.Ex)

-- diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Show diagnostics in quickfix list" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>c", "<cmd>silent! cclose<CR>", {
        desc = "Close quickfix list",
})

-- Windows management
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Pagin
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-b>", "<C-b>zz", {})

function M.setup_lsp_keymaps(bufnr)
        local opts = { buffer = bufnr, remap = false }
        local keymap = vim.keymap.set

        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        --keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap("n", "]d", vim.diagnostic.goto_next, opts)
        keymap("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
        end, opts)
end

vim.keymap.set("n", "<leader>d", function()
        local cur_win = vim.api.nvim_get_current_win()
        vim.diagnostic.open_float(nil, { scope = "cursor", focusable = true })
        vim.api.nvim_set_current_win(cur_win)
end, {
        desc = "Peek diagnostic under cursor (float, auto‐restore focus)",
})
return M
