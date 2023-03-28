vim.cmd([[ imap <silent><script><expr> <C-p> copilot#Accept("\<CR>") ]])
vim.cmd([[ let g:copilot_no_tab_map = v:true ]])

-- change color of copilot suggestion text
-- for true color terminals is should be #0977de for 256 color terminals it should be 81
vim.cmd([[ highlight CopilotSuggestion ctermfg=81 guifg=#0977de ]])
