vim.o.background = "dark"
vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
vim.cmd("let g:gruvbox_invert_selection='0'")
vim.cmd([[colorscheme gruvbox]])
