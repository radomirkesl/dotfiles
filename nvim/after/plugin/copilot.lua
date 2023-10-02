vim.api.nvim_set_keymap('i', '<C-o>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

local enabled = false
vim.cmd(":Copilot disable")
vim.keymap.set('n', '<leader>tc', function()
    if enabled then
        enabled = false
        vim.cmd(":Copilot disable")
        vim.cmd(":echo 'Copilot disabled'")
    else
        enabled = true
        vim.cmd(":Copilot enable")
        vim.cmd(":echo 'Copilot enabled'")
    end
end, {desc = '[T]oggle [C]opilot'})
