vim.g.mapleader = ' '
require("trxixn.set")
require("trxixn.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",vim.keymap
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
    
require("lazy").setup("trxixn.plugins")
require("rose-pine").setup({
    disable_background = true,
    styles = {
        italic = false,
    },
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme rose-pine-moon]])

--  set black background
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })


-- nvim-tree binds 
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

require("lspconfig").ts_ls.setup({})

-- nvim-ale config
vim.cmd [[
    let g:ale_linters = {
      \ 'typescript': ['tsserver'],
      \ 'typescriptreact': ['tsserver'],
      \ }
    let g:ale_fixers = {
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
      \ }
    let g:ale_fix_on_save = 1
]]

-- highlight clear
vim.keymap.set('n', '<leader>n', ':noh<CR>', { silent = true })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })

