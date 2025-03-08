return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "vtsls", "bashls", "lua_ls" }, -- Auto-install vtsls
        })
    end,
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    }
}
