local set = vim.opt
local function map(mode, key, action)
	vim.keymap.set(mode, key, action, {silent = true})
end

-- Always open splits to the right and below
set.splitbelow = true
set.splitright = true

-- Remap split navigation to Ctrl + hjkl
map('n', '<C-h>','<C-w>h')
map('n', '<C-j>','<C-w>j')
map('n', '<C-k>','<C-w>k')
map('n', '<C-l>','<C-w>l')

-- Make adjusting split sizes easy
map('n','<C-Left>',':vertical resize -3<CR>')
map('n','<C-Right>',':vertical resize +3<CR>')
map('n','<C-Up>',':resize +3<CR>')
map('n','<C-Down>',':resize -3<CR>')

-- Swap split orientation
map('n', '<C-f>','<C-w>t<C-w>H')
map('n', '<C-g>','<C-w>t<C-w>K')

-- Remove pipes | that act as split seperators

-- Swap split positions
map('n', '<Leader>s','<C-w>R')
