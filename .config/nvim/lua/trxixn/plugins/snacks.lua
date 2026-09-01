return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enable the image component
    image = {
      enabled = true,
      doc = {
        -- Renders the image inline in supported buffers (like Markdown)
        inline = true,
        -- Renders the image in a floating window (used if inline is disabled/unsupported)
        float = true,
        max_width = 80,
      },
    },
    
    -- OPTIONAL: snacks.nvim is a collection of utilities. 
    -- If you ONLY want the image viewer and want to ensure 
    -- other major features are disabled, add these:
    dashboard = { enabled = false },
    picker = { enabled = false },
    explorer = { enabled = false },
    notifier = { enabled = false },
    indent = { enabled = false },
  }
}
