--[[ return {
-- 1. The Completion Tool (Ghost text as you type)
{
  "milanglacier/minuet-ai.nvim",
  event = "InsertEnter",
  config = function()
    require("minuet").setup({
      provider = "gemini",
      provider_options = {
        gemini = {
          api_key = "",
          model = "gemini-2.0-flash", -- Use Flash for speed
          steam = true,
        },
      },
    })
  end,
}
}
--]]
return{}
