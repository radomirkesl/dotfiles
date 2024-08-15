-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup {

    require 'plugins.copilot',

    require 'plugins.harpoon',

    require 'plugins.telescope',

    require 'plugins.lsp',

    require 'plugins.cmp',

    require 'plugins.treesitter',

    require 'plugins.refactor',

    require 'plugins.conform',

    require 'plugins.vimtex',

    require 'plugins.whichkey',

    require 'plugins.wiki',

    'tpope/vim-sleuth',
    'tpope/vim-surround',
    'tpope/vim-repeat',

    {
        'theprimeagen/vim-be-good',
        cmd = {
            'VimBeGood',
        },
    },

    {
        'numToStr/Comment.nvim',
        event = 'VimEnter',
        opts = {},
    },

    { -- UndoTree
        'mbbill/undotree',
        keys = {
            {
                '<leader>u',
                vim.cmd.UndotreeToggle,
                desc = '[U]ndo Tree',
            },
        },
    },

    -- Visuals

    -- Color scheme:
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true,
        priority = 1000,
        opts = {
            variant = 'moon',
            disable_background = false,
            disable_float_background = false,
            highlight_groups = {
                -- MatchParen = { fg = 'iris', bg = 'highlight_high', blend = 80 },
                Cursor = { fg = 'pine', bg = 'foam' },
                iCursor = { bg = 'foam' },
                -- FloatBorder = { fg = 'iris' },
            },
        },
    },

    {
        'xiyaowong/transparent.nvim',
        lazy = false,
    },

    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            icons_enabled = true,
            theme = 'rose-pine',
            component_separators = '|',
            section_separators = '',
        },
    },

    -- Devicons
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },

    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = { char = '┊' },
        },
    },

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            signs = true,
        },
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        -- Optional dependency
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require('nvim-autopairs').setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
            local cmp = require 'cmp'
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
    },

    -- Reduces suffering
    {
        'Aasim-A/scrollEOF.nvim',
        event = { 'CursorMoved', 'WinScrolled' },
        opts = {},
    },

    -- Git related plugins
    -- 'tpope/vim-fugitive',
    -- 'tpope/vim-rhubarb',
    -- 'tpope/vim-speeddating',
    -- Commenting things out
    -- 'tpope/vim-commentary',
    -- Detect tabstop and shiftwidth automatically

    -- Markdown Preview

    -- { 'toppair/peek.nvim',                   build = 'deno task --quiet build:fast' }

    --[[ {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }, ]]
}
