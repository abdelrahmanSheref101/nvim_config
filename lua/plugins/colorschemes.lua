return {
        -- Catppuccin (all flavours built-in)
        {
                "catppuccin/nvim",
                name = "catppuccin",
                priority = 1000,
                lazy = false,
                config = function()
                        require("catppuccin").setup({
                                flavour = "mocha",  -- default flavour; you can change this later
                        })
                end,
        },

        -- Kanagawa (we’ll pick the “dragon” dark variant by default)
        {
                "rebelot/kanagawa.nvim",
                name = "kanagawa",
                priority = 1000,
                lazy = false,
                config = function()
                        require("kanagawa").setup({
                                background = { dark = "dragon" },
                        })
                end,
        },

        -- One Dark (warmer style)
        {
                "navarasu/onedark.nvim",
                name = "onedark",
                priority = 1000,
                lazy = false,
                config = function()
                        require("onedark").setup({
                                style = "warmer",
                        })
                end,
        },

        -- Rose-Pine (main flavour)
        {
                "rose-pine/neovim",
                name = "rose-pine",
                priority = 1000,
                lazy = false,
        },

        -- Nightfox (Carbonfox variant)
        {
                "EdenEast/nightfox.nvim",
                name = "nightfox",
                priority = 1000,
                lazy = false,
                config = function()
                        -- nightfox ships multiple palettes, "carbonfox" is one of them
                        vim.cmd("set background=dark")
                end,
        },
}

