return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons support
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin", -- Match Catppuccin colorscheme
				icons_enabled = true,
				section_separators = { left = "", right = "" }, -- Optional separators
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" }, -- Shows current mode (NORMAL, INSERT, etc.)
				lualine_b = { "branch", "diff", "diagnostics" }, -- Git & LSP diagnostics
				lualine_c = { { "filename", path = 1 } }, -- Show relative file path
				lualine_x = { "encoding", "filetype" }, -- Encoding & file type
				lualine_y = { "progress" }, -- Shows % through file
				lualine_z = { "location" }, -- Shows line & column
			},
			extensions = { "nvim-tree", "quickfix" }, -- Integrate with NvimTree & Quickfix
		})
	end,
}
