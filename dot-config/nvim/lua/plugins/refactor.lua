return {
    'theprimeagen/refactoring.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    keys = {
        { '<leader>crr', mode = 'v',                                        desc = '[C]ode [R]efacto[r]' },
        { '<leader>crf', mode = 'v',                                        desc = '[C]ode [R]efactor Extract [F]unction' },
        { '<leader>crF', mode = 'v',                                        desc = '[C]ode [R]efactor Extract [F]unction to File' },
        { '<leader>crv', mode = 'v',                                        desc = '[C]ode [R]efactor Extract [V]ariable' },
        { '<leader>crV', mode = 'v',                                        desc = '[C]ode [R]efactor Inline [V]ariable' },

        { '<leader>crb', desc = '[C]ode [R]efactor Extract [B]lock' },
        { '<leader>crB', desc = '[C]ode [R]efactor Extract [B]lock to File' },
        { '<leader>crV', desc = '[C]ode [R]efactor Inline [V]ariable' },
    },
    opts = {
        prompt_func_return_type = {
            go = true,
            java = true,

            cpp = true,
            c = true,
            h = true,
            hpp = true,
            cxx = true,
            python = true,
        },
        prompt_func_param_type = {
            go = true,
            java = true,

            cpp = true,
            c = true,
            h = true,
            hpp = true,
            cxx = true,
            python = true,
        },
        printf_statements = {},
        print_var_statements = {},
    },
    config = function()
        local function visual_refactor_keymap(keys, refactor_name, description)
            vim.keymap.set("v", keys,
                string.format([[ <Esc><Cmd>lua require('refactoring').refactor('%s')<CR>]], refactor_name),
                { noremap = true, silent = true, expr = false, desc = description })
        end

        local function normal_refactor_keymap(keys, refactor_name, description)
            vim.keymap.set("n", keys,
                string.format([[ <Cmd>lua require('refactoring').refactor('%s')<CR>]], refactor_name),
                { noremap = true, silent = true, expr = false, desc = description })
        end

        -- Remaps for the refactoring operations currently offered by the plugin
        visual_refactor_keymap('<leader>crf', 'Extract Function', '[C]ode [R]efactor Extract [F]unction')
        visual_refactor_keymap('<leader>crF', 'Extract Function To File', '[C]ode [R]efactor Extract [F]unction to File')
        visual_refactor_keymap('<leader>crv', 'Extract Variable', '[C]ode [R]efactor Extract [V]ariable')
        visual_refactor_keymap('<leader>crV', 'Inline Variable', '[C]ode [R]efactor Inline [V]ariable')

        -- Extract block doesn't need visual mode
        normal_refactor_keymap('<leader>crb', 'Extract Block', '[C]ode [R]efactor Extract [B]lock')
        normal_refactor_keymap('<leader>crB', 'Extract Block To File', '[C]ode [R]efactor Extract [B]lock to File')

        -- Inline variable can also pick up the identifier currently under the cursor without visual mode
        normal_refactor_keymap('<leader>crV', 'Inline Variable', '[C]ode [R]efactor Inline [V]ariable')
        -- load refactoring Telescope extension
        require("telescope").load_extension("refactoring")

        -- remap to open the Telescope refactoring menu in visual mode
        vim.keymap.set(
            "v",
            "<leader>crr",
            "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
            { noremap = true, desc = '[C]ode [R]efacto[r]' }
        )
    end
}
