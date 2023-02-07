local function map(mode, key, action)
  vim.keymap.set(mode, key, action)
end

-- Normal Mode Mappings (some expections)

-- Go to end or beginning of line
map('n', '<C-e>', '$')
map('n', '<C-a>', '0')
-- idk
-- map('n', '<C-r>', '"0p')
-- Semicolon for colon
map('n', ';', ':')
--idk
map('n', 'Y', 'y$')
map('n', '<C-p>', '"+p')
-- Open terminals
map('n', '<leader>t', ':vsplit term://bash<CR>')
map('n', '<leader>y', ':split term://bash<CR>')
-- Show registry or buffers
map('n', '<C-r>', ':reg<CR>')
map('n', '<C-b>', ':ls<CR>')
-- Open vertical splits by buffer number
map('n', '<leader>1', ':vert sb 1<CR>')
map('n', '<leader>2', ':vert sb 2<CR>')
map('n', '<leader>3', ':vert sb 3<CR>')
map('n', '<leader>4', ':vert sb 4<CR>')
map('n', '<leader>5', ':vert sb 5<CR>')
map('n', '<leader>6', ':vert sb 6<CR>')
map('n', '<leader>7', ':vert sb 7<CR>')
map('n', '<leader>8', ':vert sb 8<CR>')
map('n', '<leader>9', ':vert sb 9<CR>')
-- Go to next/previous buffers
map('n', '<A-p>', ':bn<CR>')
map('n', '<A-o>', ':bp<CR>')
map('i', '<A-p>', '<ESC>:bn<CR>')
map('i', '<A-p>', '<ESC>:bn<CR>')
-- nvim-tree
map('n', '<leader>f', ':NERDTreeToggle<CR>')
-- formatting
map('n', '<leader>w', ':Format<CR>')
-- Insert Mode Mappings
map('i', 'qq', '<ESC>')
map('i', '<C-e>', '<ESC>A')
map('i', '<C-a>', '<ESC>0i')
map('i', '<C-h>', '<Left>')
map('i', '<C-l>', '<Right>')
map('i', '<C-k>', '<Up>')
map('i', '<C-j>', '<Down>')
map('i', '<C-u>', '<ESC>ui')
map('i', '<C-d>', '<ESC>ddi')
map('i', ';;', '<ESC>:')
map('i', '<C-b>', '<ESC>GA')
map('i', 'zz', '<ESC>zz')
map('i', '<C-p>', '<ESC>"+pi<Right>')
map('i', '<C-b>', '<ESC>:reg<CR>')
map('i', '<leader>f', '<ESC>:NERDTreeToggle<CR>')
map('i', '<leader>w', '<ESC>:Format<CR>i')
-- Visual Mode Mappings
map('v', 'qq', '<ESC>')
map('v', '<C-c>', '"+y')

-- Command Mode Mappings
map('c', 'qq', 'q!')

-- Terminal Mode Mappings
map('t', 'qq', '<C-\\><C-n>')
