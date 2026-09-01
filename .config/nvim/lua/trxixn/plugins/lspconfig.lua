return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- LSP Management
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        -- Formatting & UI
        "stevearc/conform.nvim",
        "j-hui/fidget.nvim",

        -- Autocompletion 
        "saghen/blink.cmp",
    },
    config = function()
        -- Setup UI for LSP loading progress
        require("fidget").setup({})

        -- Setup Formatting 
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
            }
        })

        -- Setup Mason & Tools
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua", "prettier", "biome", "isort", "pylint"
            }, -- Auto-installs formatters and linters
        })

        -- Get Capabilities from blink.cmp
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Setup Mason-LSPConfig with the DYNAMIC HANDLERS approach
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", "rust_analyzer", "ts_ls", "tailwindcss",
                "html", "cssls", "emmet_language_server", "marksman", "clangd",
            },
            handlers = {
                -- DEFAULT HANDLER: Automatically sets up all installed servers
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                -- OVERRIDE: Specific settings just for lua_ls
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                            },
                        },
                    })
                end,

                -- OVERRIDE: Specific settings just for clangd
                ["clangd"] = function()
                    require("lspconfig").clangd.setup({
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--query-driver=**/*arm-none-eabi-gcc*,**/*arm-none-eabi-g++*"
                        }
                    })
                end,

                -- OVERRIDE: Specific settings just for tailwind
                ["tailwindcss"] = function()
                    require("lspconfig").tailwindcss.setup({
                        capabilities = capabilities,
                        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro" },
                    })
                end,
            },
        })

        -- Setup Global Diagnostics
        vim.diagnostic.config({
            virtual_text = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        -- Setup LSP Keymaps (Fires only when a server attaches to a buffer)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                -- Your preferred Telescope and standard bindings
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "df", vim.diagnostic.open_float, opts)
            end,
        })
    end,
}
