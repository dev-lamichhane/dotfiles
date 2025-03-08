return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },         -- Lua formatter
                bash = { "shfmt" },         -- Bash formatter
                javascript = { "prettier" }, -- JS/TS formatter
                typescript = { "prettier" }, -- TS formatter
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true, -- Use LSP formatting if no formatter is found
            },
        })
    end,
}

