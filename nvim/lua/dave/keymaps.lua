local function map(mode, key, action)
	vim.keymap.set(mode, key, action, { noremap = true, silent = true })
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
map("n", "ve", "y$")
map("n", "vb", "y0")
map("n", "vbr", "y%")
map("n", "vw", "yiw")
-- Copy to clipboard
map("n", "ce", '"+y$')
map("n", "cb", '"+y0')
map("n", "cbr", '"+y%')
map("n", "cw", '"+yiw')
-- Cut/delete to default register
map("n", "xe", "d$")
map("n", "xb", "d0")
map("n", "xbr", "d%")
map("n", "xw", "diw")
-- Cut/delete to clipboard
map("n", "be", '"+d$')
map("n", "bb", '"+d0')
map("n", "bbr", '"+d%')
map("n", "bw", '"+diw')

map("n", "cp", '"+p')
map("n", "cpp", '"+P')
-- Open terminals
map("n", "<leader>y", ":vsplit term://bash<CR>")
map("n", "<leader>h", ":split term://bash<CR>")
-- Show registry or buffers
map("n", "<C-r>", ":reg<CR>")
map("n", "<C-b>", ":ls<CR>")

-- Open vertical splits by buffer number
for i = 1, 9 do
	map("n", "<leader>" .. i, ":vert sb " .. i .. "<CR>")
end

-- Open horizontal splits by buffer number
for i = 1, 9 do
	map("n", "<leader>h" .. i, ":hor sb " .. i .. "<CR>")
end

-- Go to next/previous buffers
map("n", "<A-p>", ":bn<CR>")
map("n", "<A-o>", ":bp<CR>")

-- Nvim Tree
map("n", "<leader>f", ":NvimTreeToggle<CR>")
map("n", "<leader>d", ":NvimTreeRefresh<CR>")

-- Formatting (Normal + Insert Mode)
map("n", "<leader>p", function()
	vim.lsp.buf.format({ async = true })
end)

map("i", "<leader>p", function()
	vim.lsp.buf.format({ async = true })
	vim.api.nvim_input("<ESC>i") -- Return to insert mode after formatting
end)

-- Clear search
map("n", "nh", ":nohl<CR>")

-- GitHub Copilot
map("n", "<A-j>", ":Copilot disable<CR>")
map("n", "<A-k>", ":Copilot enable<CR>")

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
map("v", "cy", '"+y') -- copy to clipboard, normal 'y' will copy to default register

------------------------------------------------
-- Command Mode Mappings
------------------------------------------------

map("c", "qq", "q!")

------------------------------------------------
-- Terminal Mode Mappings
------------------------------------------------

map("t", "qq", "<C-\\><C-n>")

-- Move focus between splits & NvimTree
map("n", "<C-h>", function()
	if vim.bo.filetype == "NvimTree" then
		vim.cmd("wincmd l") -- Move right if inside NvimTree
	else
		vim.cmd("wincmd h") -- Move left normally
	end
end)

map("n", "<C-l>", function()
	local is_nvim_tree = vim.bo.filetype == "NvimTree"
	if is_nvim_tree then
		vim.cmd("wincmd p") -- Move to the last active window (editor)
	else
		vim.cmd("wincmd l") -- Move right normally
	end
end)
