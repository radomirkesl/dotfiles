vim.cmd.colorscheme 'rose-pine'

-- Save undo history
vim.o.undofile = true

-- I have a Nerd Font
vim.g.have_nerd_font = true

-- Set cursor
vim.o.guicursor = 'n-v-c:block-Cursor,i:ver25-iCursor'

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Indentation
vim.o.smartindent = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.textwidth = 0

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Cursor won't go any closer to the top or bottom of the screen, unless it is the start or end of the file
vim.o.scrolloff = 12

-- Visual column on the right
vim.o.colorcolumn = '120'

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', get = nil, append = nil, prepend = nil, remove = nil }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank { timeout = 1000 }
    end,
    group = highlight_group,
    pattern = '*',
})

-- vim.g.mapleader = ' ' (has to be defined before plugins are loaded)
