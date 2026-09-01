vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })

-- leetcode:
-- language selector
vim.keymap.set('n', '<leader>lc', ':Leet lang<CR>', { desc = 'Change LeetCode language' })

-- Runs the test cases
vim.keymap.set('n', '<leader>lr', ':Leet test<CR>', { desc = 'LeetCode Run Tests' })

-- Submits the solution
vim.keymap.set('n', '<leader>lf', ':Leet submit<CR>', { desc = 'LeetCode Submit' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { 
  noremap = true, 
  silent = true, 
  desc = "Show full diagnostic message" 
})

-- Trigger a code action (the "fix")
vim.keymap.set('n', '<leader>xa', vim.lsp.buf.code_action, { 
  noremap = true, 
  silent = true, 
  desc = "Execute code action (Apply Fix)" 
})


-- LSP based keys
function Lsp_keymaps_setup(bufnr, client)
    -- Options to ensure the mapping is buffer-local
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Core LSP Mappings (Universal for all servers)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts, {desc = "Go to Definition"})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts, {desc = "Go to Implementation"})
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts, { desc = "Find References"})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts, {desc = "Rename "})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts,{desc = "Hover Documentation"})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts, {desc = "Code Actions"})

    -- Can add server-specific logic here using client.name
    if client.name == 'clangd' then
        vim.keymap.set('n', '<leader>ch', '<cmd>ClangdSwitchSourceHeader<CR>', bufopts)
    end
end

-- Move between windows using Ctrl + h/j/k/l
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = "Move to left window" })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = "Move to right window" })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = "Move to lower window" })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = "Move to upper window" })

-- Move to previous/next bufferline tab
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Loop through numbers 1 to 9
for i = 1, 9 do
    -- Maps <leader>1, <leader>2, etc.
    vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", { desc = "Go to buffer " .. i })
end

-- Map <leader>0 to jump to the very last buffer in the line
vim.keymap.set("n", "<leader>0", "<cmd>BufferLineGoToBuffer -1<cr>", { desc = "Go to last buffer" })

-- Close the current tab (buffer)
vim.keymap.set("n", "<leader>w", "<cmd>bdelete<cr>", { desc = "Close current tab" })
