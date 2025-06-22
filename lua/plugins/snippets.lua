return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",   -- optional community snippets
  },
  config = function()
    local luasnip = require("luasnip")

    -- 1) Load your own Lua-based snippets
    require("luasnip.loaders.from_lua").load({
      -- Path to your snippets
      paths = vim.fn.stdpath("config") .. "/lua/snippets"
    })

    -- 2) Load community VSCode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

