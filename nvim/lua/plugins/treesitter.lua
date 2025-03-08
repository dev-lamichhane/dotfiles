return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Automatically update parsers
	event = { "BufReadPre", "BufNewFile" }, -- Load Treesitter only when opening a file
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
			}, -- Install these parsers
			auto_install = true, -- Automatically install missing parsers
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false, -- Use Treesitter instead of old regex highlighting
			},
			indent = { enable = true }, -- Better indentation
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Jump forward to the next text object
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})
	end,
}
