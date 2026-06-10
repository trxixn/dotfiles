-- ~/.config/nvim/lsp/tsserver.lua

return {
    -- 1. Command to execute the language server binary
    -- We assume 'typescript-language-server' is on your PATH (e.g., via Mason wrapper)
    cmd = { "typescript-language-server", "--stdio" }, 

    -- 2. Filetypes that trigger the server
    filetypes = { 
        "typescript", 
        "javascript", 
        "typescriptreact", 
        "javascriptreact", 
        "json" 
    },

    -- 3. Root markers for project detection
    -- These files tell Neovim where the project root starts.
    root_markers = { 
        "tsconfig.json", 
        "jsconfig.json", 
        "package.json", 
        ".git" 
    },

    -- 4. Initialization Options (Crucial for TSLS)
    -- These settings are passed directly to the server upon startup.
    init_options = {
        hostInfo = "neovim",
        preferences = {
            importModuleSpecifierPreference = "non-relative", -- Use package names where possible
            importModuleSpecifierEnding = "js",              -- Add .js extension in imports
            -- Disable prompt for package install (rely on user package management)
            disableAutomaticTypeAcquisition = true, 
        },
    },

    -- 5. Attach Keymaps (If not using a global LspAttach Autocommand)
    -- If you use the global LspAttach Autocommand, you can remove this block.
    -- on_attach = function(client, bufnr)
    --     local bufopts = { noremap = true, silent = true, buffer = bufnr }
    --     -- Your keymaps here, e.g.:
    --     -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    -- end,

    -- 6. Server-specific settings (Passed via the settings key in the config)
    settings = {
        typescript = {
            inlayHints = {
                enumMemberValues = { enabled = true },
            },
        },
    },
}
