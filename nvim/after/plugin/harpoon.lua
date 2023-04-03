local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>+', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>ě', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>š', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>č', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>ř', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>ž', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>ý', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>á', function() ui.nav_file(8) end)
vim.keymap.set('n', '<leader>í', function() ui.nav_file(9) end)
vim.keymap.set('n', '<leader>é', function() ui.nav_file(10) end)

