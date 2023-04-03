require('refactoring').setup({
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
})

local function visual_refactor_keymap(keys, refactor_name)
    vim.keymap.set("v", keys,
        string.format([[ <Esc><Cmd>lua require('refactoring').refactor('%s')<CR>]], refactor_name),
        { noremap = true, silent = true, expr = false })
end

local function normal_refactor_keymap(keys, refactor_name)
    vim.keymap.set("n", keys,
        string.format([[ <Cmd>lua require('refactoring').refactor('%s')<CR>]], refactor_name),
        { noremap = true, silent = true, expr = false })
end

-- Remaps for the refactoring operations currently offered by the plugin
visual_refactor_keymap('<leader>re', 'Extract Function')
visual_refactor_keymap('<leader>rf', 'Extract Function To File')
visual_refactor_keymap('<leader>rv', 'Extract Variable')
visual_refactor_keymap('<leader>ri', 'Inline Variable')

-- Extract block doesn't need visual mode
normal_refactor_keymap('<leader>rb', 'Extract Block')
normal_refactor_keymap('<leader>rf', 'Extract Block To File')

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
normal_refactor_keymap('<leader>ri', 'Inline Variable')
-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.keymap.set(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
)
