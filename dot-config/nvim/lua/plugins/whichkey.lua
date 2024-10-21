-- Useful plugin to show you pending keybinds.
return {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').add {
            { '<leader>c', group = '[C]ode' },
            { '<leader>cr', group = '[C]ode [R]efactor' },
            { '<leader>d', group = '[D]ocument' },
            { '<leader>r', group = '[R]ename' },
            { '<leader>s', group = '[S]earch' },
            { '<leader>w', group = '[W]orkspace' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>h', group = '[H]arpoon' },
            { '<leader>h', group = 'Git [H]unk', mode = 'v' },
        }
    end,
}
