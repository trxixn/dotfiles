-- 1. Find the project root
-- We use Neovim's native vim.fs to look upward for standard Java project markers.
local root_markers = { 'gradlew', 'pom.xml', '.git' }
local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])

-- Fallback to current working directory if no markers are found
if not root_dir then
    root_dir = vim.fn.getcwd()
end

-- 2. Generate a unique workspace path for JDTLS
-- We extract the project folder name (the "tail" of the path) and append it to the Neovim data dir.
local project_name = vim.fn.fnamemodify(root_dir, ':p:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name

-- 3. Define the configuration
local config = {
    -- The command to start the language server.
    -- NOTE: This assumes 'jdtls' is in your system PATH (e.g., installed via Mason).
    -- If it's not, you will need to provide the absolute path to the jdtls executable.
    cmd = {
        'jdtls',
        '-data', workspace_dir,
        '--jvm-arg=-Xmx2G', -- Allocate 2GB of RAM to the language server
    },

    root_dir = root_dir,

    -- Core Settings
    settings = {
        java = {
            signatureHelp = { enabled = true },
            format = { enabled = true },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            inlayHints = {
                parameterNames = {
                    enabled = "all", -- literals, all, none
                },
            },
            completion = {
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.mockito.Mockito.*",
                },
            },
        }
    },

    -- Native client capabilities (optional but recommended if you use nvim-cmp or blink.cmp)
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- 4. Start or attach the server
-- This hooks directly into Neovim's native LSP client.
require('jdtls').start_or_attach(config)
