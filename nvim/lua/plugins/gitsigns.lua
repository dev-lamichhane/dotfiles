return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Load only when opening a file
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" }, -- Green bar for added lines
				change = { text = "│" }, -- Blue bar for modified lines
				delete = { text = "_" }, -- Underscore for deleted lines
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			numhl = false, -- No number highlight
			linehl = false, -- No line highlight
			signcolumn = true, -- Show Git signs in the gutter
			current_line_blame = true, -- Show git blame on current line
			current_line_blame_opts = {
				delay = 300,
				virt_text_pos = "eol",
			},
		})
	end,
}
