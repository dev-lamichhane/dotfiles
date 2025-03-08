return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter", -- Load only when entering insert mode
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
