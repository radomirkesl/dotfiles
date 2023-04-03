local selected = 'rose-pine'

require('lualine').setup{
    options = {
        icons_enabled = false,
        theme = selected,
        component_separators = '|',
        section_separators = '',
    },
}

require('rose-pine').setup {
    variant = 'moon',
    disable_background = true,
    disable_float_background = true,
}

require('nightfox').setup {
    options = {
        transparent = false,
    }
}

vim.cmd.colorscheme(selected)
