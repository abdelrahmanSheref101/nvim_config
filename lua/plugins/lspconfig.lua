-- FILE: lua/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    local on_attach = function(_, bufnr)
      require("config.keymaps").setup_lsp_keymaps(bufnr)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
  
        vim.diagnostic.config({
          virtual_text = false,          -- disable inline text
          signs = true,                  -- keep signs like "E", "W"
          underline = true,              -- underline the problem
          update_in_insert = false,      -- don't update while typing
          severity_sort = true,          -- sort by severity in location list
        })


    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "eslint",
        "clangd",
      },
      automatic_installation = true,
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    })
  end,
}

