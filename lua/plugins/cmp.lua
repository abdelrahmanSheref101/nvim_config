return {
        "hrsh7th/nvim-cmp",
        dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "lukas-reineke/cmp-under-comparator",
                "tzachar/cmp-tabnine",
                "onsails/lspkind.nvim",
                -- add path source plugin
                "hrsh7th/cmp-path",
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
                                        luasnip.lsp_expand(args.body)
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
                                        elseif luasnip.expand_or_jumpable() then
                                                luasnip.expand_or_jump()
                                        else
                                                fallback()
                                        end
                                end, { "i", "s" }),
                                ["<S-Tab>"] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_prev_item()
                                        elseif luasnip.jumpable(-1) then
                                                luasnip.jump(-1)
                                        else
                                                fallback()
                                        end
                                end, { "i", "s" }),
                        }),

                        formatting = {
                                format = lspkind.cmp_format({
                                        mode = "symbol_text",
                                        maxwidth = 50,
                                        ellipsis_char = "...",
                                }),
                        },

                        sources = cmp.config.sources({
                                { name = "nvim_lsp",    group_index = 1 },
                                { name = "luasnip",     group_index = 2 },
                                { name = "cmp_tabnine", group_index = 3 },
                        }, {
                                { name = "buffer", group_index = 4, keyword_length = 2 },
                                -- enable path completion with no minimum chars
                                { name = "path",   group_index = 5, keyword_length = 0 },
                        }),

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
