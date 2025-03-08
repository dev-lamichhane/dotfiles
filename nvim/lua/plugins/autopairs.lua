return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- Load when entering insert mode
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			check_ts = true, -- Enable Treesitter integration
			fast_wrap = {}, -- Enables fast wrapping
			disable_filetype = { "TelescopePrompt", "vim" }, -- Don't auto-close in certain files
		})

		-- ✅ Integrate with `nvim-cmp` for smooth autocomplete
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
