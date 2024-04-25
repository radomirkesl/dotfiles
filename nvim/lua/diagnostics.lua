-- configuration of diagnostics, mainly toggling virtual text

local virtex = true

vim.diagnostic.config {
    virtual_text = virtex,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
}

vim.keymap.set('n', '<leader>td', function()
    if virtex then
        vim.diagnostic.config {
            virtual_text = false
        }
        virtex = false
    else
        vim.diagnostic.config {
            virtual_text = true
        }
        virtex = true
    end
end, { desc = '[T]oggle [D]iagnostics (virtual text)' })
