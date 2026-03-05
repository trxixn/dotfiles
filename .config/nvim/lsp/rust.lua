return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = {
        'Cargo.toml',
        'rust-project.json',
        '.git',
    },
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                    enable = true,
                },
            },
            -- FIX: checkOnSave must be a boolean now
            checkOnSave = true,
            -- FIX: The command is now defined under the 'check' key
            check = {
                command = "clippy",
            },
            procMacro = {
                enable = true,
                ignored = {
                    ["async-trait"] = { "async_trait" },
                    ["napi-derive"] = { "napi" },
                    ["async-recursion"] = { "async_recursion" },
                },
            },
        },
    },
}
