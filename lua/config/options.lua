-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & Indentation
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse
vim.opt.mouse = "a"

vim.opt.signcolumn = "yes"

-- Inforce some opitons on markdown files
vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
                vim.opt_local.tabstop = 8
                vim.opt_local.shiftwidth = 8
                vim.opt_local.expandtab = false
        end,
})

-- Buffer lines before or after the cursor
vim.opt.scrolloff = 10
