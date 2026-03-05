-- .config/nvim/lsp/astro.lua

return {
    -- cmd = { "astro-language-server" },
    cmd = { "astro-ls", "--stdio" },
    filetypes = { "astro" },

    root_markers = {
        '.git',
    },

}
