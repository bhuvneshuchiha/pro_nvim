vim.api.nvim_set_keymap('n', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '', { noremap = true, silent = true })

-- vim.g.mapleader = " "

-- vim.g.maplocalleader = " "
--
-- vim.opt.guicursor = "n-v-i-c:block-Cursor"
--
-- local o = vim.o
-- o.cursorline = false
-- o.expandtab = true
-- o.smartindent = true
-- o.tabstop = 2
-- o.shiftwidth = 2
--
-- vim.opt.list = false
-- vim.scriptencoding = "utf-8"
-- vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"
-- vim.opt.colorcolumn = "75" --- colorcolumn (disable to remove colorcolumn)
--
-- --Gives better highlight for gruvbox theme, comment out below 2 lines
-- --while using other themes.
-- -- Set the background color to black and the text color to cyan for the popup menu
-- vim.cmd("highlight Pmenu ctermbg=black ctermfg=cyan guibg=#000000 guifg=#00ffff")
-- -- Set the background color for the selected item to a lighter black and the text color to cyan
-- vim.cmd("highlight PmenuSel ctermbg=black ctermfg=cyan guibg=#1c1c1c guifg=#00ffff")
--
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.termguicolors = true
-- vim.opt.title = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.hlsearch = true
-- vim.opt.incsearch = true
-- vim.opt.backup = false
--
-- vim.opt.showcmd = true -- vim.opt this to true for status line
-- vim.opt.cmdheight = 1 -- vim.opt to 1 if you want to see primagen like status line, plus comment out
-- --some code in noice, lua and nvim-notify.
-- vim.opt.laststatus = 2 -- vim.opt this to 1 as well for status line.
--
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true
--
-- vim.opt.scrolloff = 10
-- vim.opt.inccommand = "split"
-- vim.opt.ignorecase = true
-- vim.opt.smarttab = true
-- vim.opt.breakindent = true
-- vim.opt.wrap = false
-- vim.opt.backspace = { "start", "eol", "indent" }
-- vim.opt.path:append({ "**" })
-- vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true
-- vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""
-- vim.opt.showmode = true -- need to vim.opt it true to show commands in status line like prime.
--
-- -- Add asterisks in block comments
-- vim.opt.formatoptions:append({ "r" })
-- vim.opt.statusline = [[%<%F %h%m%r %y %=%{v:register} %-14.(%l,%c%V%) %p%%]] -- for the status line
-- -- vim.g.netrw_browse_split = 0
-- -- vim.g.netrw_banner = 0
-- -- vim.g.netrw_winsize = 25 -- Make size 25 to netrw take less space.
-- vim.o.signcolumn = "yes" -- For git showing blue line
-- -- vim.api.nvim_set_keymap("n", "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true }) --netrw binding.
