vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.updatetime = 50

--NOTE:Below two line disable netrw flash.
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Set the sign column to a fixed width of 2
vim.o.signcolumn = "yes"

-- Increase the number column width to include padding
vim.opt.guicursor = "n-v-i-c:block-Cursor"
require("bhuvnesh.set")
require("bhuvnesh.remap")
require("bhuvnesh.lazy_init")
-- Define a function to check the filetype and run gcc if cpp
-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

--NOTE:This is to enable netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local o = vim.o
o.cursorline = false
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 4

vim.opt.list = false
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.colorcolumn = "75" --- colorcolumn (disable to remove colorcolumn)

--Gives better highlight for gruvbox theme, comment out below 2 lines
--while using other themes.
-- Set the background color to black and the text color to cyan for the popup menu
-- vim.cmd("highlight Pmenu ctermbg=black ctermfg=cyan guibg=#000000 guifg=#00ffff")
-- Set the background color for the selected item to a lighter black and the text color to cyan
-- vim.cmd("highlight PmenuSel ctermbg=black ctermfg=cyan guibg=#1c1c1c guifg=#00ffff")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.backup = false

vim.opt.showcmd = true -- vim.opt this to true for status line
vim.opt.cmdheight = 1 -- vim.opt to 1 if you want to see primagen like status line, plus comment out
--some code in noice, lua and nvim-notify.
vim.opt.laststatus = 2 -- vim.opt this to 1 as well for status line.

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.showmode = true -- need to vim.opt it true to show commands in status line like prime.

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
vim.opt.statusline = [[%<%F %h%m%r %y %=%{v:register} %-14.(%l,%c%V%) %p%%]] -- for the status line
-- vim.api.nvim_set_keymap("n", "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true }) --netrw binding.

-- IMPORTANT **RestoreCursorPosition**
function RestoreCursorPosition()
	local line = vim.fn.line("'\"")
	if
		line > 1
		and line <= vim.fn.line("$")
		and vim.bo.filetype ~= "commit"
		and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
	then
		vim.cmd('normal! g`"')
	end
end

if vim.fn.has("autocmd") then
	vim.cmd([[
    autocmd BufReadPost * lua RestoreCursorPosition()
  ]])
end

--LSP autocmd
autocmd("LspAttach", {
	group = ThePrimeagenGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
	end,
})
