-- We must explicitly enable snippet support to prevent the server from crashing
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
    -- Mason installs this binary. "--stdio" is required.
    cmd = { "vscode-css-language-server", "--stdio" },
    
    filetypes = { "css", "scss", "less" },
    
    root_markers = {
        'package.json',
        '.git',
        'Cargo.toml', -- Added for your Rust workspace context
    },
    
    -- Pass the snippet-enabled capabilities
    capabilities = capabilities,
    
    settings = {
        css = {
            validate = true,
            lint = {
                -- "ignore" is often better if you use frameworks like Tailwind 
                -- or tools that introduce custom @rules (like @apply)
                unknownAtRules = "ignore", 
            },
        },
        scss = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
        },
        less = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
        },
    },
}
