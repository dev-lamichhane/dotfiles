-- Close NERDTree if it's the only tab
vim.cmd([[autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]])




