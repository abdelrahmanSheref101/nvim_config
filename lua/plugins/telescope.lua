return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",  -- for faster sorting
  },
  build = "make",  -- for fzf-native
  cmd = "Telescope",
  keys = {},  -- we'll define keymaps in your keymap file
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 10,
      },
    })

    -- Load native fzf extension if available
    pcall(telescope.load_extension, "fzf")
  end,
}

