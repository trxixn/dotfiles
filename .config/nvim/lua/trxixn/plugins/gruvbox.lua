return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      -- changes the background to #1d2021
      contrast = "hard", 
      
      transparent_mode = false,
      italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = true,
      },
    })
  end,
}
