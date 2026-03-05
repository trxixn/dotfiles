require("trxixn.set")
require("trxixn.remap")
require("trxixn.lazy_init")

require("rose-pine").setup({
      disable_background = false,
      styles = {
         italic = false,
      },
})

vim.cmd([[colorscheme rose-pine-moon]])

--  set black background put here after loading 
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false, -- don't update erros while typing
    severity_sort = true,
})


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- Retrieve the client object using its ID
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- Call your setup function, passing BOTH bufnr and client
        Lsp_keymaps_setup(args.buf, client)
    end,
})

-- LSP enabling
vim.lsp.enable('lua_ls', true)
vim.lsp.enable('clangd', true)
vim.lsp.enable('jdtls', true)
vim.lsp.enable('tsserver', true)
-- vim.lsp.enable('astro', true)
vim.lsp.enable('rust', true)
vim.lsp.enable('html', true)
vim.lsp.enable('css', true)
