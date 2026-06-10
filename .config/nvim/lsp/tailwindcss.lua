return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "html", "css", "scss",
        "javascript", "javascriptreact",
        "typescript", "typescriptreact",
        "astro", "svelte", "vue",
    },
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "tailwind.config.cjs",
        "postcss.config.js",
        "package.json",
        ".git",
    },
    settings = {
        tailwindCSS = {
            validate = true,
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                invalidConfigPath = "error",
                invalidTailwindDirective = "error",
                recommendedVariantOrder = "warning",
            },
        },
    },
}
