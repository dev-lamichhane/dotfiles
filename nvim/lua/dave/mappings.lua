local function map(mode, key, action)
	vim.keymap.set(mode, key, action)
end

------------------------------------------------
-- Normal Mode Mappings
------------------------------------------------

-- Go to end or beginning of line
map("n", "<C-e>", "$")
map("n", "<C-a>", "0")
-- Semicolon for colon
map("n", ";", ":")
-- Copy to default register
map("n", "ve", "y$") -- from cursor to the end of line
map("n", "vb", "y0") -- from cursor to the beginning of line
map("n", "vbr", "y%") -- copy between matching brackets (), {} and []
map("n", "vw", 'yiw') -- copy current word
-- Copy to clipboard
map("n", "ce", '"+y$') -- from cursor to the end of line to the clipboard.
map("n", "cb", '"+y0') -- from cursor to the beginning of line to the clipboard.
map("n", "cbr", '"+y%') -- copy between matching brackets (), {} and [] to the clipboard.
map("n", "cw", '"+yiw') -- copy current word to the clipboard.
-- Cut/delete to default register
map("n", "xe", "d$") -- from cursor to the end of line
map("n", "xb", "d0") -- from cursor to the beginning of line
map("n", "xbr", "d%") -- copy between matching brackets (), {} and []
map("n", "xw", 'diw') -- copy current word
-- Cut/delete to clipboard
map("n", "be", '"+d$') -- from cursor to the end of line to the clipboard.
map("n", "bb", '"+d0') -- from cursor to the beginning of line to the clipboard.
map("n", "bbr", '"+d%') -- copy between matching brackets (), {} and [] to the clipboard.
map("n", "bw", '"+diw') -- copy current word to the clipboard.

map("n", "cp", '"+p') -- paste from clipboard after the cursor, normal p will paste from default
map("n", "cpp", '"+P') -- paste from clipboard before the cursor, normal P will paste from default
-- Open teinals
map("n", "<leader>y", ":vsplit term://bash<CR>")
map("n", "<leader>h", ":split term://bash<CR>")
-- Show registry or buffers
map("n", "<C-r>", ":reg<CR>") -- show registry
map("n", "<C-b>", ":ls<CR>") -- show buffers
-- Open vertical splits by buffer number
map("n", "<leader>1", ":vert sb 1<CR>")
map("n", "<leader>2", ":vert sb 2<CR>")
map("n", "<leader>3", ":vert sb 3<CR>")
map("n", "<leader>4", ":vert sb 4<CR>")
map("n", "<leader>5", ":vert sb 5<CR>")
map("n", "<leader>6", ":vert sb 6<CR>")
map("n", "<leader>7", ":vert sb 7<CR>")
map("n", "<leader>8", ":vert sb 8<CR>")
map("n", "<leader>9", ":hor sb 9<CR>")
-- Open horizontal splits by buffer number
map("n", "<leader>h1", ":hor sb 1<CR>")
map("n", "<leader>h2", ":hor sb 2<CR>")
map("n", "<leader>h3", ":hor sb 3<CR>")
map("n", "<leader>h4", ":hor sb 4<CR>")
map("n", "<leader>h5", ":hor sb 5<CR>")
map("n", "<leader>h6", ":hor sb 6<CR>")
map("n", "<leader>h7", ":hor sb 7<CR>")
map("n", "<leader>h8", ":hor sb 8<CR>")
map("n", "<leader>h9", ":hor sb 9<CR>")
-- Go to next/previous buffers
map("n", "<A-p>", ":bn<CR>")
map("n", "<A-o>", ":bp<CR>")
map("i", "<A-p>", "<ESC>:bn<CR>")
map("i", "<A-p>", "<ESC>:bn<CR>")
-- NERDTree
map("n", "<leader>f", ":NERDTreeToggle<CR>")
map("n", "<leader>d", ":NERDTreeRefreshRoot<CR>")
-- formatting
map("n", "<leader>p", ":Prettier<CR>")
-- clear search
map("n", "nh", ":nohl<CR>")
-- github copilot
map("n", "<A-j>",":Copilot disable<CR>")
map("n", "<A-k>",":Copilot enable<CR>")

------------------------------------------------
-- Insert Mode Mappings
------------------------------------------------

map("i", "qq", "<ESC>") -- exiting insert mode
map("i", "<C-u>", "<ESC>ui") -- undo
map("i", "<C-d>", "<ESC>ddi") -- delete line
map("i", ";;", "<ESC>:") -- semicolon for colon
map("i", "zz", "<ESC>zz") -- center cursor
map("i", "<C-p>", '<ESC>"+pi<Right>') -- paste from clipboard after the cursor
map("i", "<C-P>", '<ESC>"+Pi<Right>') -- paste from clipboard before the cursor
map("i", "<C-r>", "<ESC>:reg<CR>") -- show registry
map("i", "<leader>p", "<ESC>:Prettier<CR>i") -- formatting

--NERDTree
map("i", "<leader>f", "<ESC>:NERDTreeToggle<CR>") -- Toggle
map("i", "<leader>f", "<ESC>:NERDTreeRefreshRoot<CR>") -- Refresh 

-- Navigation
map("i", "<C-e>", "<ESC>A")
map("i", "<C-a>", "<ESC>0i")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-k>", "<Up>")
map("i", "<C-j>", "<Down>")

------------------------------------------------
-- Visual Mode Mappings
------------------------------------------------

map("v", "qq", "<ESC>")
map("v", "cy", '"+y') -- copy to cliboard, normal 'y' will copy to default register

------------------------------------------------
--Command Mode Mappings
------------------------------------------------

map("c", "qq", "q!")

------------------------------------------------
-- Terminal Mode Mappings
------------------------------------------------

map("t", "qq", "<C-\\><C-n>")
