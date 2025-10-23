require("trxixn.set")
require("trxixn.remap")
require("trxixn.lazy_init")

require("rose-pine").setup({
      disable_background = true,
      styles = {
         italic = false,
      },
})


vim.cmd([[colorscheme rose-pine-moon]])

--  set black background put here after loading
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })

