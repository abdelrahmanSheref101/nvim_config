-- for icons
return { 
        {
                "nvim-tree/nvim-web-devicons",
                lazy = true, -- load when needed 
        }
        ,{
                "echasnovski/mini.nvim",
                config = function()
                require("mini.icons").setup()
                end
        }
}


