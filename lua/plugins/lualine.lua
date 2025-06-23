return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },  -- Optional: for file type icons
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",       -- Automatically use colors from colorscheme
        section_separators = { left = "", right = "" }, -- Fancy glyphs (need Nerd Font)
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true, -- One unified statusline
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}

