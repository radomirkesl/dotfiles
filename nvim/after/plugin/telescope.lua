-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        }
    }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local tbuiltin = require('telescope.builtin')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>sr', tbuiltin.oldfiles, { desc = '[S]earch [R]ecently opened files' })
vim.keymap.set('n', '<leader>sb', tbuiltin.buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    tbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

local function find_files()
    if os.execute 'git rev-parse --is-inside-work-tree' == 0 then
        return tbuiltin.git_files
    else
        return tbuiltin.find_files
    end
end

vim.keymap.set('n', '<leader>sf', tbuiltin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sgi', tbuiltin.git_files, { desc = '[S]earch [Gi]t' })
vim.keymap.set('n', '<leader>sh', tbuiltin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', tbuiltin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sgr', tbuiltin.live_grep, { desc = '[S]earch by [Gr]ep' })
vim.keymap.set('n', '<leader>sd', tbuiltin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', tbuiltin.keymaps, { desc = '[S]earch [K]eybindings' })

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
