return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Add devicons as a dependency
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = true,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			renderer = {
				root_folder_label = function(path)
					return vim.fn.fnamemodify(path, ":~") -- Shortens long paths
				end,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = true, -- Close NvimTree after opening a file
				},
			},
		})
		-- I could not implement autoclosing nvim-tree if it's the last windo
		-- come back to this some other time
	end,
}
