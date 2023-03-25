require("dave.options")
require("dave.mappings")
require("dave.splits")
require("dave.plugins")
require("dave.statusline")
require("dave.treesitter")
require("dave.vimscripts")
require("dave.autopairs")
require("dave.comments")
require("dave.gitsigns")
require("dave.nerdtree")

-- LSP and completion
require("dave.cmp") -- snippets, buffer included in this
require("dave.lsp.mason")
require("dave.lsp.lspsaga")
require("dave.lsp.lspconfig")
require("dave.lsp.null-ls")
require("dave.copilot")
