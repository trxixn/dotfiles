local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Enable completion capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- C++: clangd
lspconfig.clangd.setup({
  capabilities = capabilities,
})

-- Python: pyright
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

-- Lua: lua_ls
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      completion = { callSnippet = "Replace" },
    },
  },
})

-- JavaScript/TypeScript: tsserver
lspconfig.tsserver.setup({
  capabilities = capabilities,
})

-- GraphQL: graphql
lspconfig.graphql.setup({
  filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
})

-- Emmet: emmet_ls
lspconfig.emmet_ls.setup({
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- ESLint: eslint
lspconfig.eslint.setup({
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})
