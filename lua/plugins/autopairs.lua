return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- lazy-load when entering insert mode
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- enables treesitter integration (for smarter pairing)
    })
  end,
}

