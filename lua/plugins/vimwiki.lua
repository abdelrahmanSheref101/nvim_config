-- ~/.config/nvim/lua/plugins/vimwiki.lua
return {
        "vimwiki/vimwiki",

        -- 1) Set g: variables *before* Vimwiki is loaded
        init = function()
                vim.g.vimwiki_list = {
                        {
                                path = "~/vimwiki", -- ← adjust to your wiki folder
                                syntax = "markdown",
                                ext = ".md",
                        },
                }
                vim.g.vimwiki_ext2syntax = { [".md"] = "markdown" }
                vim.g.vimwiki_markdown_link_ext = 1
                vim.g.vimwiki_global_ext = 1
        end,

        -- 2) Lazy-load when you hit <leader>ww
        keys = {
                { "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "Vimwiki Index" },
        },

        -- 3) No `config` block needed here—Vimwiki is Vimscript-based and autoloads itself.
}
