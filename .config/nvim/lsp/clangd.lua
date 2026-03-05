-- ~/.config/nvim/lsp/clangd.lua

return {
    -- The command to execute the clangd server
    cmd = { "clangd" },
    
    -- Filetypes that trigger the clangd server to start
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'h', 'hpp' },
    
    -- Root markers clangd looks for to define the project directory.
    -- The 'compile_commands.json' is crucial for C/C++ projects.
    root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
    

    -- Optional: Add command-line arguments to clangd
    settings = {
        clangd = {
            arguments = {
                '--background-index',
                '--clang-tidy',
                -- Use this if your compile_commands.json is in a subdir (like 'build')
                -- '--compile-commands-dir=build', 
            },
        },
    },
}
