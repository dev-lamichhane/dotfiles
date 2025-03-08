return {
	-- Main completion plugin
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source
		"hrsh7th/cmp-buffer", -- Buffer words source
		"hrsh7th/cmp-path", -- Path completion
		"hrsh7th/cmp-cmdline", -- Command-line completion
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet completion for luasnip
		"onsails/lspkind.nvim", -- Adds icons to completion
		"rafamadriz/friendly-snippets", -- Extra snippets (optional)
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load custom JSON snippets
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

		-- Set up nvim-cmp
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(), -- Open completion menu
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
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
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						path = "[Path]",
					},
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true, -- Shows ghost text like VSCode
			},
		})
	end,
}
