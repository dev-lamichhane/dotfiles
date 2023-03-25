local set = vim.opt
local function map(mode, key, action)
	vim.keymap.set(mode, key, action, { silent = true })
end

-- Always open splits to the right and below
set.splitbelow = true
set.splitright = true

-- create and manage splits
map("n", "<leader>q", "<C-w>v") -- split window vertically
map("n", "<leader>w", "<C-w>s") -- split window horizontally
map("n", "<leader>e", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>r", ":close<CR>") -- close current split window

-- Remap split navigation to Ctrl + hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Make adjusting split sizes easy
map("n", "<C-a>", ":vertical resize +3<CR>")
map("n", "<C-f>", ":vertical resize -3<CR>")
map("n", "<C-s>", ":resize +3<CR>")
map("n", "<C-d>", ":resize -3<CR>")

-- Swap split orientation
map("n", "<C-f>", "<C-w>t<C-w>H")
map("n", "<C-g>", "<C-w>t<C-w>K")

-- Swap split positions
map("n", "<Leader>g", "<C-w>R")

-- useless shit
