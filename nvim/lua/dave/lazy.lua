-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Ensure Neovim finds the plugins folder
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/lua")

-- Initialize Lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Import plugins from lua/plugins/
  },
  install = { colorscheme = { "catppuccin-macchiato" } },
  checker = { enabled = true }, -- Automatically check for updates
})

