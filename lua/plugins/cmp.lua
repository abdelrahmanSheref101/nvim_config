return {
        "hrsh7th/nvim-cmp",
        dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "lukas-reineke/cmp-under-comparator",
                "tzachar/cmp-tabnine",
                "onsails/lspkind.nvim",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
        },
        event = "InsertEnter",
        config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")
                local lspkind = require("lspkind")

                require("luasnip.loaders.from_vscode").lazy_load()

                local compare = require("cmp.config.compare")

                cmp.setup({
                        performance = {
                                max_view_entries = 10,
                        },

                        snippet = {
                                expand = function(args)
                                        require("luasnip").lsp_expand(args.body)
                                end,
                        },

                        mapping = cmp.mapping.preset.insert({
                                ["<C-n>"] = cmp.mapping.select_next_item(),
                                ["<C-p>"] = cmp.mapping.select_prev_item(),
                                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                ["<C-Space>"] = cmp.mapping.complete(),
                                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                                ["<Tab>"] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_next_item()
                                        else
                                                fallback()
                                        end
                                end, { "i", "s" }),

                                ["<S-Tab>"] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_prev_item()
                                        else
                                                fallback()
                                        end
                                end, { "i", "s" }),
                        }),

                        sources = {
                                { name = "nvim_lsp" },
                                { name = "luasnip" },
                                { name = "cmp_tabnine" },
                                { name = "buffer" },
                                { name = "path" },
                        },
                        formatting = {
                                format = function(entry, vim_item)
                                        -- Deduplicate across sources: let first source win
                                        vim_item.dup = ({
                                                nvim_lsp = 0,
                                                luasnip = 0,
                                                cmp_tabnine = 0,
                                                buffer = 0,
                                                path = 0,
                                        })[entry.source.name] or 0
                                        return vim_item
                                end,
                        },

                        sorting = {
                                priority_weight = 2,
                                comparators = {
                                        compare.exact,
                                        compare.recently_used,
                                        compare.locality,
                                        compare.score,
                                        compare.offset,
                                        compare.kind,
                                        compare.sort_text,
                                        compare.length,
                                        compare.order,
                                },
                        },

                        matching = {
                                disallow_prefix_unmatching = true,
                        },
                })

                -- autopairs on confirm
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
}
