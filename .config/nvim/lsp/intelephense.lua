return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_markers = {
        "composer.json",
        ".git",
    },
    init_options = {
        globalStoragePath = vim.fn.stdpath("data") .. "/intelephense",
    },
    settings = {
        intelephense = {
            files = {
                maxSize = 1000000,
            },
        },
    },
}
