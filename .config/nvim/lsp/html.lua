return {
    cmd = { "html-lsp"},
    
    filetypes = { "html"}, 
    
    root_markers = {
        '.git',
        'package.json',
    },
    
    settings = {
        html = {
            format = {
                enable = true,
                wrapLineLength = 120,
                unformatted = "inline", -- Don't format inside inline tags like <span> or <b>
                indentInnerHtml = true,
            },
            suggest = {
                html5 = true,
            },
            validate = {
                -- scripts = false, -- disable JS validations for templates in askama 
                -- styles = false,  --- disable CSS validations for templates in askama
            },
        },
    },
}
