local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>prn', vim.lsp.buf.rename, '[P]erform [R]e[n]ame')
    nmap('<leader>pca', vim.lsp.buf.code_action, '[P]erform [C]ode [A]ction')
    nmap('<leader>df', vim.diagnostic.open_float, 'Open [D]iagnostic in a [F]loat')
    nmap('<leader>dl', vim.diagnostic.setloclist, 'Open [D]iagnostics [L]ist')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>gtd', vim.lsp.buf.type_definition, '[G]oto [T]ype [D]efinition')
    nmap('<leader>ssd', require('telescope.builtin').lsp_document_symbols, '[S]earch [S]ymbols in [D]ocument ')
    nmap('<leader>ssw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]earch [S]ymbols in [W]orkspace')

    -- See `:help K` for why this keymap
    nmap('H', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-h>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('<leader>gd', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Formatting
    local function format()
        vim.lsp.buf.format {
            formatting_options = {
                tabSize = vim.o.tabstop,
                insertSpaces = true,
                trimTrailingWhitespace = true,
                insertFinalNewline = true,
                trimFinalNewlines = true,
            }
        }
    end

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', format, { desc = 'Format current buffer with LSP' })
    -- Keymap for formatting
    nmap('<leader>pf', format, '[P]erform [F]ormatting')
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    clangd = { cmd = { "clangd", "--clang-tidy" } },
    pyright = {},
    rust_analyzer = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

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

vim.keymap.set('n', '<leader>dt', function()
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
end, { desc = '[D]iagnostics [T]oggle (virtual text)' })
