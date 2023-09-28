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

local function visual_refactor_keymap(keys, refactor_name, description)
    vim.keymap.set("v", keys,
        string.format([[ <Esc><Cmd>lua require('refactoring').refactor('%s')<CR>]], refactor_name),
        { noremap = true, silent = true, expr = false, desc = description })
end

local function normal_refactor_keymap(keys, refactor_name, description)
    vim.keymap.set("n", keys,
        string.format([[ <Cmd>lua require('refactoring').refactor('%s')<CR>]], refactor_name),
        { noremap = true, silent = true, expr = false , desc = description})
end

-- Remaps for the refactoring operations currently offered by the plugin
visual_refactor_keymap('<leader>pef', 'Extract Function', '[P]erform [E]xtract [F]unction')
visual_refactor_keymap('<leader>peF', 'Extract Function To File', '[P]erform [E]xtract [F]unction to file')
visual_refactor_keymap('<leader>pev', 'Extract Variable', '[P]erform [E]xtract [V]ariable')
visual_refactor_keymap('<leader>piv', 'Inline Variable', '[P]erform [I]nline [V]ariable')

-- Extract block doesn't need visual mode
normal_refactor_keymap('<leader>peb', 'Extract Block', '[P]erform [E]xtract [B]lock')
normal_refactor_keymap('<leader>peB', 'Extract Block To File', '[P]erform [E]xtract [B]lock to file')

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
normal_refactor_keymap('<leader>piv', 'Inline Variable', '[P]erform [I]nline [V]ariable')
-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.keymap.set(
    "v",
    "<leader>prr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true, desc = '[P]erform [R]efacto[r]'}
)
