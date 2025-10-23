--[[return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local jdtls = require("jdtls")

    local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    local workspace_folder = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
      cmd = { "jdtls", "-data", workspace_folder },
      root_dir = root_dir,
      settings = {
        java = {},
      },
      init_options = {
        bundles = {},
      },

      -- Suppress jdtls spam like "Publish Diagnostics"
      handlers = {
        ["window/logMessage"] = function(_, result)
          -- Filter out messages you don’t want
          if result and result.message then
            if result.message:match("Publish Diagnostics") then
              return
            end
          end
          -- Optionally keep other logs if you like
          -- vim.notify(result.message, vim.log.levels.INFO)
        end,
        ["window/showMessage"] = function(_, result)
          -- same idea — suppress messages
          if result and result.message then
            if result.message:match("Publish Diagnostics") then
              return
            end
          end
          -- vim.notify(result.message, vim.log.levels[result.type])
        end,
      },
   }


    config.handlers = {
      ["$/progress"] = function(_, result)
        if result and result.value and result.value.title then
          if result.value.title:match("Publish Diagnostics") then
            return
          end
        end
      end,
    }

    jdtls.start_or_attach(config)

    -- Optional keymaps
    vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { buffer = true })
    vim.keymap.set("n", "<leader>ec", jdtls.extract_constant, { buffer = true })
    vim.keymap.set("n", "<leader>em", jdtls.extract_method, { buffer = true })
    vim.keymap.set("n", "<leader>rt", jdtls.test_nearest_method, { buffer = true })
    vim.keymap.set("n", "<leader>rT", jdtls.test_class, { buffer = true })
  end,
}]]

