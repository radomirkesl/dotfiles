return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
        ensure_installed = {
            'lua',
            'luadoc',
            'vim',
            'vimdoc',
            'bash',
            'regex',
            'latex',
            'bibtex',
            'markdown',
            'markdown_inline',
            'go',
            'python',
            'hyprlang',
            'java',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby', 'python' } },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                node_decremental = '<c-s-space>',
                scope_incremental = '<c-s>',
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },

            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']f'] = '@function.outer',
                    [']c'] = '@class.outer',
                    [']a'] = '@parameter.outer',
                },
                goto_next_end = {
                    [']F'] = '@function.outer',
                    [']C]'] = '@class.outer',
                    [']A'] = '@parameter.outer',
                },
                goto_previous_start = {
                    ['[f'] = '@function.outer',
                    ['[c'] = '@class.outer',
                    ['[a'] = '@parameter.outer',
                },
                goto_previous_end = {
                    ['[F'] = '@function.outer',
                    ['[C'] = '@class.outer',
                    ['[A'] = '@parameter.outer',
                },
            },

            swap = {
                enable = true,
                swap_next = {
                    ['sf'] = '@function.outer',
                    ['sc'] = '@class.outer',
                    ['sa'] = '@parameter.outer',
                },
                swap_previous = {
                    ['sF'] = '@function.outer',
                    ['sC'] = '@class.outer',
                    ['sA'] = '@parameter.outer',
                },
            },
        },
    },
    config = function(_, opts)
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        -- Prefer git instead of curl in order to improve connectivity in some environments
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        vim.filetype.add {
            pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
        }
    end,
}
