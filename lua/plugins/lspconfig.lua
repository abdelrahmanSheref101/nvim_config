return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1) Start Mason
    require("mason").setup()

    -- 2) Tell Mason‑LSPConfig which servers to install & auto-enable
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",    -- use ts_ls (v2) instead of tsserver
        "eslint",
      },
      automatic_installation = true,  -- optional, but ensures servers stay installed
    })

    local lspconfig = require("lspconfig")
    local keymaps = require("config.keymaps")  -- import helper

    -- 3) Configure each server directly
    local default_opts = {
      -- e.g. common capabilities, on_attach, etc.
      -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
      -- on_attach = function(client, bufnr) … end,
    }

    -- Lua
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_opts, {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }))

    -- Python
    lspconfig.pyright.setup(default_opts)

    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup(default_opts)

    -- ESLint (as an LSP)
    lspconfig.eslint.setup(default_opts)
  end,
}

