return {
    'lervag/wiki.vim',
    keys = {
        {
            '<leader>ww',
            desc = 'Open [W]iki index',
        },
    },
    cmd = {
        'WikiIndex',
    },
    config = function()
        vim.g.wiki_root = '~/notes'
    end,
}
