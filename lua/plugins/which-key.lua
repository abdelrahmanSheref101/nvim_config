-- FILE: lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = "<Up> ",
        Down = "<Down> ",
        Left = "<Left> ",
        Right = "<Right> ",
        C = "<C-…> ",
        M = "<M-…> ",
        D = "<D-…> ",
        S = "<S-…> ",
        CR = "<CR> ",
        Esc = "<Esc> ",
        ScrollWheelDown = "<ScrollWheelDown> ",
        ScrollWheelUp = "<ScrollWheelUp> ",
        NL = "<NL> ",
        BS = "<BS> ",
        Space = "<Space> ",
        Tab = "<Tab> ",
        F1 = "<F1>",
        F2 = "<F2>",
        F3 = "<F3>",
        F4 = "<F4>",
        F5 = "<F5>",
        F6 = "<F6>",
        F7 = "<F7>",
        F8 = "<F8>",
        F9 = "<F9>",
        F10 = "<F10>",
        F11 = "<F11>",
        F12 = "<F12>",
      },
    },

    spec = {
      { "<leader>s", group = "Search" },
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>sr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
      { "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Grep in Buffer" },
    }
  }
}

