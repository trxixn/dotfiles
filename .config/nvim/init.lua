require("trxixn.set")
require("trxixn.remap")

if vim.g.vscode then
    local vscode = require('vscode')

    -- File Explorer (replaces nvim-tree)
    vim.keymap.set('n', '<leader>e', function() vscode.call('workbench.view.explorer') end)

    -- Telescope replacements
    vim.keymap.set('n', '<leader>ff', function() vscode.call('workbench.action.quickOpen') end) -- Find files
    vim.keymap.set('n', '<leader>fw', function() vscode.call('workbench.action.findInFiles') end) -- Live grep
    vim.keymap.set('n', '<leader>fo', function() vscode.call('workbench.action.openRecent') end) -- Old files
    vim.keymap.set('n', '<leader>b', function() vscode.call('workbench.action.showAllEditors') end) -- Buffers

    -- LSP replacements (replaces your standard LSP remaps)
    vim.keymap.set('n', '<leader>rn', function() vscode.call('editor.action.rename') end) 
    vim.keymap.set('n', '<leader>ca', function() vscode.call('editor.action.quickFix') end) 
    vim.keymap.set('n', '<leader>gd', function() vscode.call('editor.action.revealDefinition') end) 
    vim.keymap.set('n', '<leader>gr', function() vscode.call('editor.action.goToReferences') end) 
    vim.keymap.set('n', 'K', function() vscode.call('editor.action.showHover') end) 

else
    require("trxixn.lazy_init")
    require("rose-pine").setup({
          disable_background = false,
          styles = {
             italic = false,
          },
    })

    vim.cmd([[colorscheme rose-pine-moon]])

    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false, -- don't update errors while typing
        severity_sort = true,
    })

    -- LSP Attach Autocommand
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            Lsp_keymaps_setup(args.buf, client)
        end,
    })

    vim.lsp.enable({
        "lua_ls", "cssls", "rust_analyzer", "clangd",
        "haskell-language-server", "intelephense",
        "tailwindcss", "ts_ls", "pyright"
    })
end
