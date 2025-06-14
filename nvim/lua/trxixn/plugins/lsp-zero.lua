return {
  -- LSP-zero (helper only)
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- LSP installer
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- LSP bridge between mason + lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          lua_ls = function()
            local opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(opts)
          end,

          tsserver = function()
            require('lspconfig').tsserver.setup({
              on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { buffer = bufnr })
              end,
            })
          end
        }
      })
    end
  },

  -- LSP base setup and keymaps
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)
    end
  }
}
