return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers", -- Turns every open file into a tab
                diagnostics = "nvim_lsp", -- Shows error icons in the tabs!
                always_show_bufferline = true,
            }
        })
    end
}
