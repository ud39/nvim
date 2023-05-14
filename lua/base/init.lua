require('base.remap')
require('base.packer')
require('base.filetype')
require('base.set')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.cmd('cnoremap <C-e> <End>')         -- move to end of line
vim.cmd('cnoremap <C-d> <Del>')         -- delete character under cursor
vim.cmd('cnoremap <C-k> <C-U>')         -- delete from cursor to end of line
vim.cmd('cnoremap <C-u> <C-B>')         -- delete from start of line to cursor
vim.cmd('cnoremap <C-h> <BS>')          -- delete previous character (backspace)
vim.cmd('cnoremap <C-w> <C-BS>')        -- delete previous word
vim.cmd('cnoremap <C-n> <Down>')        -- move to next command-line history item
vim.cmd('cnoremap <C-p> <Up>')          -- move to previous command-line history item
vim.cmd('cnoremap <C-r> <C-R>=i_ctrl_r()<CR>')  -- insert contents of register

-- Coloring
vim.api.nvim_set_hl(0, 'LineNr', { italic = true, bold = true, ctermfg='lightcyan'} )








-- Disable arrow keys
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

