vim.api.nvim_set_keymap('n', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '', { noremap = true, silent = true })

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
-- vim.opt.guicursor = {
--     'n-v-c:block', -- Normal, Visual, and Command mode: block cursor
--     'i:ver25',     -- Insert mode: vertical bar cursor (25% width)
--     'r-cr:hor20',  -- Replace and Command-line replace mode: horizontal cursor (20% height)
-- }

-- vim.opt.guicursor = {
-- 	"n-v-c:block", -- Normal, visual, command-line: block cursor
-- 	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
-- 	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
-- 	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
-- 	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
-- 	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
