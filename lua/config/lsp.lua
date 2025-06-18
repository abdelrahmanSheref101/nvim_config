-- Make sure mason and lspconfig are loaded
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright" }, -- auto-install these
})

-- Basic LSP setup
local lspconfig = require("lspconfig")


