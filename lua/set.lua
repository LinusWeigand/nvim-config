vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = false
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ':w!<CR>', {})
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-x>', ':close<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wv', ':vsp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wh', ':sp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>Sf', ':Telescope session-lens search_session<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- Comment
vim.keymap.set('n', '<leader>/', function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
	end, {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('v', '<leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {noremap = true, silent = true})

