return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Ensure correct variant
      integrations = {}, -- Remove Lazy.nvim integration since it doesn't exist
    })
    vim.cmd.colorscheme("catppuccin-macchiato")
  end
}

