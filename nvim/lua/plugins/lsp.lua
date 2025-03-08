return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- Function to run when LSP attaches to a buffer
		local on_attach = function(client, bufnr)
			local bufmap = function(mode, lhs, rhs)
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
			end

			-- Keybindings
			bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
			bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
			bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
			bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		end

		-- Capabilities for autocompletion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- TypeScript (vtsls)
		lspconfig.vtsls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Bash (bashls)
		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Lua (lua_ls)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } }, -- Fix undefined 'vim' warning
					workspace = { checkThirdParty = false }, -- Avoid annoying popups
				},
			},
		})
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Completion support
	},
}
